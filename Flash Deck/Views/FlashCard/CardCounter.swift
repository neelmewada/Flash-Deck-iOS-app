//
//  CardCounter.swift
//  Flash Deck
//
//  Created by Neel Mewada on 10/03/21.
//

import SwiftUI

struct CardCounter: View {
    @EnvironmentObject var modelData: ModelData
    
    var cardPackIndex: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 500)
            .stroke(Color(hex: "DDDDDD"), style: StrokeStyle(lineWidth: 2))
            .foregroundColor(.white)
            .frame(maxWidth: 128, maxHeight: 50)
            .overlay(
                VStack {
                    Text("CARDS")
                        .font(.custom("Lato-Regular", size: 12))
                        .foregroundColor(Color(hex: "b1b1b1"))
                    Text("\(Int(modelData.curIndexGlobal) + 1) / \(modelData.cardPacks[cardPackIndex].cards.count)")
                        .font(.custom("Lato-Bold", size: 16))
                        .foregroundColor(Color(hex: "373737"))
                }
            )
    }
}

struct CardCounter_Previews: PreviewProvider {
    static var previews: some View {
        CardCounter(cardPackIndex: 0)
            .environmentObject(ModelData())
    }
}
