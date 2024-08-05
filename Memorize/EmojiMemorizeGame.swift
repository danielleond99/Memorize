//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Daniel Leon on 2/8/24.
//

import SwiftUI

struct EmojiMemorizeGame {
    private static let emojis = ["😓", "😌", "👻", "😎", "😭", "👻", "🇷🇪", "❤️", "🩷", "🇩🇴"]
    
    private static func createMemorizeGame() -> MemorizeGame<String>{
     return MemorizeGame(
        numberPairsOfCard: 4)
        {index in
            if emojis.indices.contains(index){
                return emojis[index]
            } else {
                return "⁉️"
            }
        }
    }
    

    
    private var model = createMemorizeGame()
    
    var cards: Array<MemorizeGame<String>.Card> {
        return  model.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
       return model.choose(card: card)
    }
    
}
