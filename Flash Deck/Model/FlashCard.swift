//
//  Card.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

import Firebase

/// A data structure used to represent a Flash Card Pack.
/// It has all the information about each flash card pack
struct FlashCardPack: Hashable, Codable, Identifiable {
    var id: Int
    var packName: String
    var iconName: String
    var packDescription: String
    var cards: [FlashCard]
    
    var icon: WebImage {
        WebImage(url: URL(string: iconName))
    }
}

/// A data structure used to represent a single Flash Card.
struct FlashCard: Hashable, Codable, Identifiable {
    var id: Int
    var cardPack: Int
    var name: String
    var question: String
    var answer: String
    
}
