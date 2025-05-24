//
//  MemorizeEmojiGame.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import SwiftUI

class MemorizeGameViewModel: ObservableObject, Identifiable {
    private static let emojis = ["🐷", "🦑", "🐯", "🐘", "🐬", "🦇", "🐸", "🦜", "🐠", "🦧", "🦕", "🐣"]
    
    private static func createMemorizeGame() -> MemorizeGameModel<String> {
        return MemorizeGameModel(numberOfPairsOfCards: 3) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemorizeGame()
    
    var cards: Array<MemorizeGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: MemorizeGameModel<String>.Card) {
        model.choose(card)
        print("tapped")
    }
}
