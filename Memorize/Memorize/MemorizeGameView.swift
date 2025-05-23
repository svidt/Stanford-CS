//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import SwiftUI

struct MemorizeGameView: View {
    var viewModel: MemorizeGameViewModel = MemorizeGameViewModel() // ViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(Color.orange)
    }
}

struct CardView: View {
    let card: MemorizeGameModel<String>.Card
    
    init(_ card: MemorizeGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base
                .fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    MemorizeGameView()
}

