//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Leon on 3/5/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    let contentCards: [String] = ["😓", "😌", "👻", "😎", "😭", "👻", "🇷🇪", "❤️", "🩷", "🇩🇴"]
    
    @State var cardCount = 4
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: contentCards[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
    
   
     
    var body: some View {
        VStack{
            cards
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
