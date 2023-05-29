//
//  Onboarding.swift
//  Care&Love
//
//  Created by mohamdan on 29/05/2023.
//

import SwiftUI

struct Onboarding: View {
    //: property
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @State var isanimation : Bool = false
    @State var imageOffset : CGSize = (CGSize(width: 0.0, height: 0.0))
    @State var buttonOffset : CGFloat = 0.0
    @State var buttonWidth : Double = UIScreen.main.bounds.width - 80
    //:body
    var body: some View {
        ZStack{
            Color("colorBlue")
                .ignoresSafeArea()
            
            VStack{
                //MARK: - Header
                VStack{
                    Text(abs(imageOffset.width)>0 ? "Love" : "Care")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("love")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                }//:Vstack
                .offset(y: isanimation ? 0 : -80)
                .animation(.easeOut(duration: 1), value: isanimation)
                //MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x: (imageOffset.width) * -1)
                        .blur(radius: abs(imageOffset.width)/5, opaque: false)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .offset(x: imageOffset.width, y: 0)
                        .rotationEffect(.degrees(imageOffset.width/15))
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 3, y: 30)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundColor(.white)
                                .opacity((imageOffset.width)>0 ? 0 : 1)
                            ,alignment: .bottom
                        )
                        .frame(width: 300)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if abs(gesture.translation.width) >= 150 {
                                    imageOffset = gesture.translation                                }
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        imageOffset = .zero
                                    }
                                })
                        )
                }//:Ztack
                //MARK: - Footer
                ZStack{
                    //:1-BackGround
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    //:2-Text
                    Text("Start")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 30, design: .rounded))
                    //:3-Capsoule Dynamic
                    HStack{
                        Capsule()
                            .fill(Color("colorRed"))
                            .frame(width: 80 + buttonOffset)
                        Spacer()
                    }//:Hstack (End of Capsoule Dynamic)
                    //:4-Draggable circle
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("colorRed"))
                            Circle()
                                .opacity(0.2)
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                        }//:Zstack
                        .frame(width: 80, alignment: .center)
                        .offset(x: buttonOffset)
                            .gesture(DragGesture()
                                .onChanged({ gesture in
                                    if (gesture.translation.width >= 0.0) && (buttonOffset <= buttonWidth - 80){
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                    .onEnded({ _ in
                                        withAnimation(.easeOut(duration: 0.5)){
                                            if buttonOffset >= buttonWidth/2 {
                                                isOnboarding = false
                                            }else{
                                                buttonOffset = 0
                                            }
                                        }
                                        
                                    })
                        )
                        Spacer()
                    }//:Hstack (End of Draggable circle)
                    
                }//:Zstack (End of Footer)
                .frame(height: 80)
                .padding(.horizontal, 40)
                .offset(y: isanimation ? 0 : 80)
                .animation(.easeOut(duration: 1), value: isanimation)
            }//Vstack
        }//:Zstack
        .onAppear{
            isanimation.toggle()
        }
    }
}
//: preview
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
