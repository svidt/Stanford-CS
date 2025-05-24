//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kristian Emil on 23/05/2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = MemorizeGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: game)
        }
    }
}
