//
//  ContentView.swift
//  Lecture 01
//
//  Created by Kristian Emil on 22/05/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐷", "🦑", "🐯", "🐘", "🐬", "🦇", "🐸", "🦜", "🐠", "🦧", "🦕", "🐣"]

    var body: some View {
            ScrollView {
                cards
            }

        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 10)

            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            print("Tapped")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
