//
//  ModelData.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import Foundation
import Combine
import SwiftUI

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ModelData: ObservableObject {
    @Published var cardPacks: [FlashCardPack] = []
    
    // Runtime variables
    @Published var curCardPackIndex: Int = 0
    @Published var curIndexGlobal: Int = 0
    
    public static var db: Firestore? = nil
    
    init() {
        FirebaseApp.configure()
        self.loadData()
    }
    
    public func loadData() -> Void {
        Self.db = Firestore.firestore()
        //self.cardPacks = load("cardsData.json")
        var i = 0
        
        Self.db?.collection("card-packs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let id = document.data()["id"] as! Int
                    let packName = document.data()["packName"] as! String
                    let packDescription = document.data()["packDescription"] as! String
                    let cardsRef = document.data()["cards"] as! DocumentReference
                    let iconName = document.data()["iconName"] as! String
                    
                    var cardPack = FlashCardPack(id: id, packName: packName, iconName: iconName, packDescription: packDescription, cards: [])
                    
                    cardsRef.getDocument { (cardsDoc, error) in
                        if let cardsDoc = cardsDoc, cardsDoc.exists {
                            let dataDescription = cardsDoc.data().map(String.init(describing:)) ?? "nil"
                            guard let dict = cardsDoc.data() else {
                                print("Dict Failed!!!")
                                return
                            }
                            let cardsArray = dict["cards"] as! [[String: Any]]
                            print("Document data: \(cardsArray[0]["name"] ?? "ERROR")")
                            for cardInfo in cardsArray {
                                let id = cardInfo["id"] as! Int
                                let name = cardInfo["name"] as! String
                                let question = cardInfo["question"] as! String
                                let answer = cardInfo["answer"] as! String
                                cardPack.cards.append(FlashCard(id: id, cardPack: cardPack.id, name: name, question: question, answer: answer))
                            }
                            self.cardPacks.append(cardPack)
                        } else {
                            print("Document does not exist")
                        }
                    }
                    
                    i += 1
                }
            }
        }
    }
}


struct FirestoreCard: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var question: String
    var answer: String
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
