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
    
    //:body
    var body: some View {
        ZStack{
            Color("colorBlue")
                .ignoresSafeArea()
            
            VStack{
                //MARK: - Header
                VStack{
                    Text("Care")
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
                
                //MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 3, y: 30)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundColor(.white)
                            ,alignment: .bottom
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
                            .frame(width: 80)
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
                        Spacer()
                    }//:Hstack (End of Draggable circle)
                }//:Zstack (End of Footer)
                .frame(height: 80)
                .padding(.horizontal, 40)
            }//Vstack
        }//:Zstack
        
    }
}
//: preview
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
