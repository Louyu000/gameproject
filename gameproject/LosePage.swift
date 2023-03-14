//
//  LosePage.swift
//  gameproject
//
//  Created by Lou on 2023/3/14.
//

import SwiftUI

struct LosePage: View {
    @Binding var showSecondView: Bool
    @Binding var showThirdView: Bool
    @Binding var money: Int
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            VStack{
                Text("You Lose").font(.system(size: 50))
                Image("restart").onTapGesture {
                    money=3000000
                    showSecondView=false
                    showThirdView=false
                }
            }
            
            
        }
    }
}

struct LosePage_Previews: PreviewProvider {
    static var previews: some View {
        LosePage(showSecondView:.constant(true),showThirdView:.constant(true),money:.constant(0))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
