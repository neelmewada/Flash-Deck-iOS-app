//
//  Flash_DeckApp.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import SwiftUI

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@main
struct Flash_DeckApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
