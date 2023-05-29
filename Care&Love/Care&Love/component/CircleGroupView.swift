//
//  SwiftUIView.swift
//  Care&Love
//
//  Created by mohamdan on 29/05/2023.
//

import SwiftUI

struct CircleGroupView: View {
    //:property
    var circleGroupColor : Color = .red
    //:body
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//:Zstack
        
    }
}
//:preview
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView()
    }
}
