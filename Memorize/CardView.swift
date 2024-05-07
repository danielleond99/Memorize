//
//  CardView.swift
//  Memorize
//
//  Created by Daniel Leon on 7/5/24.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp = false
    var content = ""
    
    func handleOnTap() {
        isFaceUp.toggle()
    }
    
    var body: some View {
        ZStack{
            let baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                baseRoundedRectangle.foregroundColor(.white)
                baseRoundedRectangle.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                baseRoundedRectangle
            }
        }.onTapGesture(perform: handleOnTap)
    }
}
