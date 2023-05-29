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
    //: body
    
    var body: some View {
        VStack{
            Text("Home")
            
            Button {
                isOnboarding.toggle()
            } label: {
              Text("Restart")
                    .font(.largeTitle)
            }

        }//Vstack
    }
}
//: preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
