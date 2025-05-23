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
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView: View {
    
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 10)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("🐱")
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
