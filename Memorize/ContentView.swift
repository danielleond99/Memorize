//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Leon on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(text: "1")
            CardView(text: "2")
            CardView(text: "3")
            CardView(text: "4")
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var text: String = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
            Text(text).font(.largeTitle)
        }
       
    }
}

#Preview {
    ContentView()
}
