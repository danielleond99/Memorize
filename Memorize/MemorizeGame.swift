//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Daniel Leon on 2/8/24.
//

import Foundation

struct MemorizeGame<ContentCard> where ContentCard: Equatable {
    private(set) var cards: Array<Card>
    
   
    init(numberPairsOfCard: Int, contentCardFactory: (Int) -> ContentCard) {
        cards = []
        for pairsIndex in 0..<max(2, numberPairsOfCard) {
            let contentCard = contentCardFactory(pairsIndex)
            cards.append(Card(id: "\(pairsIndex)a", content: contentCard))
            cards.append(Card(id: "\(pairsIndex)b", content: contentCard))
        }
    }
    
    var indexOnlyFaceUpCard: Int? {
        get{cards.indices.filter({index in cards[index].isFaceUp}).only}
        set{cards.indices.forEach{ cards[$0].isFaceUp = newValue == $0}}
    }
    
    mutating func choose(card: Card) -> Void {
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialIndexMatch = indexOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialIndexMatch].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialIndexMatch].isMatched = true
                    }
                }else{
                    for index in cards.indices {
                        if !cards[index].isMatched{
                            cards[index].isFaceUp = false
                        }
                    }
                    indexOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    
    struct Card: Equatable, Identifiable {
        var id: String
        var isFaceUp = true
        var isMatched = false
        let content: ContentCard
    }
}

extension Array{
    var only: Element? {
        return count == 1 ? first : nil
    }
}
