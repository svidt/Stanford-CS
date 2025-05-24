//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var viewModel: MemorizeGameViewModel
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.largeTitle)
                .bold()
            
            cards
                .animation(.default, value: viewModel.cards)
            
            HStack(spacing: 20) {
                ForEach(MemorizeGameViewModel.Theme.allCases, id: \.self) { theme in
                    themeButton(for: theme)
                    
                }
            }
            .padding(.top)

        }
        .padding()
        
    }
    
    
    private var cards: some View {
        MemorizeAspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundStyle(viewModel.themeColor)
    }
    
    private func themeButton(for theme: MemorizeGameViewModel.Theme) -> some View {
        Button(action: {
            withAnimation(.easeInOut) {
                viewModel.selectTheme(theme)
            }
        }) {
            VStack {
                Image(systemName: iconForTheme(theme))
                    .font(.title2)
                Text(theme.name)
                    .font(.body)
            }
            .frame(width: 60, height: 60)
        }
        .buttonStyle(.bordered)
        .tint(theme.color)
        .scaleEffect(viewModel.currentTheme == theme ? 1.1 : 1)
    }
    
    private func iconForTheme(_ theme: MemorizeGameViewModel.Theme) -> String {
        switch theme {
        case .summer:
            return "sun.max.fill"
        case .ocean:
            return "water.waves"
        case .scary:
            return "moon.stars.fill"
        }
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
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            Angle(degrees: card.isFaceUp ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
    }
}

#Preview {
    MemorizeGameView(viewModel: MemorizeGameViewModel())
}

