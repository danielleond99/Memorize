//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Daniel Leon on 3/5/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var emojiMemorizeGame = EmojiMemorizeGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: emojiMemorizeGame)
        }
    }
}
