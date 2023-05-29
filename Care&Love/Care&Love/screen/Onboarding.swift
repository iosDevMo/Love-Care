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
        VStack{
            Button {
                isOnboarding.toggle()
            } label: {
              Text("Start")
                    .font(.largeTitle)
            }

        }//Vstack
    }
}
//: preview
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
