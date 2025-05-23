//
//  MemorizeEmojiGame.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import SwiftUI

class MemorizeGameViewModel {
    private static let emojis = ["🐷", "🦑", "🐯", "🐘", "🐬", "🦇", "🐸", "🦜", "🐠", "🦧", "🦕", "🐣"]
    
    private static func createMemorizeGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private var gameViewModel = createMemorizeGame()
    
    var cards: Array<MemorizeGame<String>.Card> {
        return gameViewModel.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        gameViewModel.shuffle()
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        gameViewModel.choose(card)
    }
}
