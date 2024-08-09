//
//  CardView.swift
//  Memorize
//
//  Created by Daniel Leon on 7/5/24.
//

import SwiftUI

struct CardView: View {
    let card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group{
                baseRoundedRectangle.foregroundColor(.white)
                baseRoundedRectangle.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            }.opacity(card.isFaceUp ? 1 : 0)
            baseRoundedRectangle.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
