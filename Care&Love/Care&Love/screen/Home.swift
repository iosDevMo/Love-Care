//
//  Home.swift
//  Care&Love
//
//  Created by mohamdan on 29/05/2023.
//

import SwiftUI

struct Home: View {
    //: property
    @AppStorage("isOnboarding") var isOnboarding : Bool = false
    @State var isAnimation : Bool = false
    let feedBack = UINotificationFeedbackGenerator()
    //: body
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            //MARK: - Header
            ZStack{
                CircleGroupView(circleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, alignment: .center)
                    .offset(y: isAnimation ? 30 : -30)
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: true), value: isAnimation)
            }//:Ztack
           
            //MARK: - Center
            Text("Children")
                .padding()
                .font(.title3)
                .foregroundColor(.gray)
            
            //MARK: - Footer
            Button {
                isOnboarding.toggle()
                playSound(soundFile: "success", soundType: "m4a")
                feedBack.notificationOccurred(.success)
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
        }//Vstack
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                isAnimation.toggle()
            }
            
        }
    }
}
//: preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
