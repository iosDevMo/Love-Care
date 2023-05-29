//
//  ContentView.swift
//  Care&Love
//
//  Created by mohamdan on 29/05/2023.
//

import SwiftUI

struct ContentView: View {
    //: propertiez
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    //: body
    var body: some View {
        if isOnboarding {
            Onboarding()
        }else{
            Home()
        }
    }
}
//: preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
