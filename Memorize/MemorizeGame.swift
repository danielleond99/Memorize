//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Daniel Leon on 2/8/24.
//

import Foundation

struct MemorizeGame<ContentCard> {
    private(set) var cards: Array<Card> = []
    
    func choose(card: Card) -> Void {
        
    }
    
    init(numberPairsOfCard: Int, contentCardFactory: (Int) -> ContentCard) {
        for index in 0..<numberPairsOfCard {
            let contentCard = contentCardFactory(numberPairsOfCard)
            cards.append(Card(content: contentCard))
            cards.append(Card(content: contentCard))
        }
    }
    
    struct Card{
        var isFaceUp = false
        var isMatched = false
        let content: ContentCard
    }
}
