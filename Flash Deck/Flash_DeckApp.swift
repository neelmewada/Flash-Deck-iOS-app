//
//  Flash_DeckApp.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import SwiftUI
import Firebase

@main
struct Flash_DeckApp: App {
    @StateObject private var modelData = ModelData()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
