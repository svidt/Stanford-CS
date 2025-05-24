//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import Foundation

struct MemorizeGameModel<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        // Add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        // game logic implementation later
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
               cards[chosenIndex].isFaceUp.toggle()
           }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print("Shuffled")
    }
    
    struct Card: Identifiable, Equatable {
        let id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
    
    
    
}
