//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Leon on 3/5/24.
//

import SwiftUI

struct ContentView: View {
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
    
    func actionButton(by offset: Int, systemNameImage: String) -> some View {
        Button(action: {
                cardCount+=offset
        }, label: {
            Image(systemName: systemNameImage)
        }).disabled(cardCount + offset < 1 || cardCount + offset > contentCards.count)
    }
    
    var cardActions: some View {
        HStack{
            actionButton(by: -1, systemNameImage: "rectangle.stack.badge.minus.fill")
            Spacer()
            actionButton(by: 1, systemNameImage: "rectangle.stack.badge.plus.fill")
            
        }.padding().imageScale(.large).font(.largeTitle)
    }
     
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardActions
        }
    }
}

#Preview {
    ContentView()
}
