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
            Group{
                baseRoundedRectangle.foregroundColor(.white)
                baseRoundedRectangle.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            baseRoundedRectangle.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture(perform: handleOnTap)
    }
}
