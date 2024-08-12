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
    
    private struct Contants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 50
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Contants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Contants.FontSize.largest))
                    .minimumScaleFactor(Contants.FontSize.largest)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Contants.Pie.inset)
        )
        .padding(Contants.inset)
        .cardify(isFaceUp: card.isFaceUp)
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack{
            let baseRoundedRectangle = RoundedRectangle(cornerRadius: Contants.cornerRadius)
            Group{
                baseRoundedRectangle.foregroundColor(.white)
                baseRoundedRectangle.strokeBorder(lineWidth: Contants.lineWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            baseRoundedRectangle.fill().opacity(isFaceUp ? 0 : 1)
        }
    }
    
    private struct Contants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
