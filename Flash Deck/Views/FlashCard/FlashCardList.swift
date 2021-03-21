//
//  FlashCardList.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import SwiftUI
import Combine


struct FlashCardList: View {
    @EnvironmentObject var modelData: ModelData
    @State var curIndex: CGFloat = 0
    
    var cardPackIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<modelData.cardPacks[cardPackIndex].cards.count) { i in
                GeometryReader { geometry in
                    let isCurrent = modelData.curIndexGlobal == Int(i)
                    FlashCardView(card: modelData.cardPacks[cardPackIndex].cards[i], cardNumber: i + 1,
                                  frontColor: isCurrent ? FlashCardView.primaryCardColor : FlashCardView.secondaryCardColor,
                                  backColor: isCurrent ? FlashCardView.backCardColor : FlashCardView.secondaryCardColor)
                        .padding(.trailing, -10)
                        .padding(.leading, -10)
                        .scaleEffect(isCurrent ? 1.07 : 1)
                        .shadow(
                            color: (isCurrent) ? FlashCardView.shadowOn : FlashCardView.shadowOff,
                            radius: 25, x: 0, y: 10)
                        .animation(.default)
                }
                .frame(width: 330, height: 500)
            }
            .padding(0)
        }
        .modifier(ScrollingHStackModifier(
            items: modelData.cardPacks[cardPackIndex].cards.count, itemWidth: 330, itemSpacing: 5, modelData: self.modelData
        ))
    }
}

struct FlashCardList_Previews: PreviewProvider {
    private static var modelData = ModelData()
    
    static var previews: some View {
        FlashCardList(cardPackIndex: 1)
            .environmentObject(modelData)
    }
}
