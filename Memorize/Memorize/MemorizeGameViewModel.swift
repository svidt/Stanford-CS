//
//  MemorizeEmojiGame.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import SwiftUI

class MemorizeGameViewModel: ObservableObject, Identifiable {
    enum Theme: CaseIterable {
        case summer
        case ocean
        case scary
        
        var emojis: [String] {
            switch self {
            case .summer:
                return ["☀️", "⛱️", "🍉", "🏄‍♀️", "🩴", "🍦"]
            case .ocean:
                return ["🐠", "🐳", "🐙", "🤿", "🌊", "🪸"]
            case .scary:
                return ["👻", "💀", "🏚️", "🧟", "🥀", "⚰️"]
            }
        }
        
        var color: Color {
            switch self {
            case .summer:
                return .yellow
            case .ocean:
                return .blue
            case .scary:
                return .black
            }
        }
        
        var name: String {
            switch self {
            case .summer:
                return "Summer"
            case .ocean:
                return "Ocean"
            case .scary:
                return "Scary"
            }
        }
    }
    
    @Published private var model: MemorizeGameModel<String>
    @Published private(set) var currentTheme: Theme
    
    init() {
        let initialTheme = Theme.summer
        self.currentTheme = initialTheme
        self.model = MemorizeGameViewModel.createMemorizeGame(theme: initialTheme)
    }
    

    
    private static func createMemorizeGame(theme: Theme) -> MemorizeGameModel<String> {
        let emojis = theme.emojis.shuffled()
        let numberOfPairs = Int.random(in: 2...min(6, emojis.count))
        
        var game = MemorizeGameModel(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
        
        game.shuffle()
        return game
    }
    
    
    var cards: Array<MemorizeGameModel<String>.Card> {
        model.cards
    }
    
    var themeColor: Color {
        currentTheme.color
    }
    
    // MARK: - Intents
    
    func selectTheme(_ theme: Theme) {
        currentTheme = theme
        model = MemorizeGameViewModel.createMemorizeGame(theme: theme)
    }
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: MemorizeGameModel<String>.Card) {
        model.choose(card)
        print("tapped")
    }
}
