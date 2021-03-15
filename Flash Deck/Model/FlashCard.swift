//
//  Card.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import Foundation
import SwiftUI

struct FlashCardPack: Hashable, Codable, Identifiable {
    var id: Int
    var packName: String
    var iconName: String
    var packDescription: String
    var cards: [FlashCard]
    
    var icon: Image {
        Image(iconName)
    }
}

struct FlashCard: Hashable, Codable, Identifiable {
    var id: Int
    var cardPack: Int
    var name: String
    var question: String
    var answer: String
    
}
