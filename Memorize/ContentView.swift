//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Leon on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    let contentCards: [String] = ["1", "2", "3", "4", "5", "6"]
        
    var body: some View {
        HStack {
            ForEach(contentCards.indices, id: \.self) { index in
                CardView(content: contentCards[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
