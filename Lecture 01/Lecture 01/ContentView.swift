//
//  ContentView.swift
//  Lecture 01
//
//  Created by Kristian Emil on 22/05/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐷", "🦑", "🐯", "🐘", "🐬"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 10)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
            } else {
                base.fill()
            }
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
