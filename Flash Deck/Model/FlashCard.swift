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

struct FlashCardPack: Hashable, Codable, Identifiable {
    var id: Int
    var packName: String
    var iconName: String
    var packDescription: String
    var cards: [FlashCard]
    
    var icon: WebImage {
        WebImage(url: URL(string: iconName))//"https://i.ibb.co/n7D7jW0/swift-logo.png"))
    }
    
    /*var icon: Image {
        let gsReference = ModelData.storage?.reference(forURL: "gs://flash-deck.appspot.com/card-pack-logos/\(iconName)")
        var uiImage: UIImage? = nil
        
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { (data, err) in
            if let err = err {
                print("Error while retrieving image: \(err.localizedDescription)")
            } else {
                print("Image retrieved Debug: \(data!.debugDescription)")
                uiImage = UIImage(data: data!)
            }
        }
        
        if uiImage != nil {
            return Image(uiImage: uiImage!)
        }
        
        print("uiImage is nil")
        return Image("gk-icon")
    }*/
}

struct FlashCard: Hashable, Codable, Identifiable {
    var id: Int
    var cardPack: Int
    var name: String
    var question: String
    var answer: String
    
}
