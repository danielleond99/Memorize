//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Daniel Leon on 2/8/24.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    private static let emojis = ["😓", "😌", "👻", "😎", "😭", "👻", "🇷🇪", "❤️", "🩷", "🇩🇴"]
    
    private static func createMemorizeGame() -> MemorizeGame<String>{
     return MemorizeGame(
        numberPairsOfCard: 10)
        {index in
            if emojis.indices.contains(index){
                return emojis[index]
            } else {
                return "⁉️"
            }
        }
    }
    

    
    @Published private var model = createMemorizeGame()
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemorizeGame<String>.Card) {
       return model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
}
