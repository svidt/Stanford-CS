//
//  ContentView.swift
//  Lecture 01
//
//  Created by Kristian Emil on 22/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(lineWidth: 5)
                Text("🐱")
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}

#Preview {
    ContentView()
}
