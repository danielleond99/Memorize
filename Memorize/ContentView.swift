//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Leon on 3/5/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    
    var body: some View {
        VStack{
            ScrollView{
                cards.animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card).aspectRatio(2/3, contentMode: .fit)
                    .padding(4).onTapGesture{
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
        
        
    }
    
   
     
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemorizeGame())
}
