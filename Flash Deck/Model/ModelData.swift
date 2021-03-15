//
//  ModelData.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var cardPacks: [FlashCardPack] = load("cardsData.json")
    
    // Runtime variables
    @Published var curCardPackIndex: Int = 0
    @Published var curIndexGlobal: Int = 0
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
