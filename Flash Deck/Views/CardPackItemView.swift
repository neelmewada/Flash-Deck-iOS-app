//
//  CardPackItemView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 13/03/21.
//

import SwiftUI

/// A View displaying each Card Pack on the home screen
struct CardPackItemView: View {
    @EnvironmentObject var modelData: ModelData
    var cardPackIndex: Int
    var width: CGFloat = 400
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 400, height: 157)
                
                HStack {
                    VStack {
                        modelData.cardPacks[cardPackIndex].icon
                            .resizable()
                            .frame(width: 48, height: 48)
                    }
                    .frame(width: 82)
                    
                    Divider()
                        .background(Color(hex: "f5f5f5"))
                        .opacity(1.0)
                    
                    VStack(alignment: .leading) {
                        Text("\(modelData.cardPacks[cardPackIndex].packName)")
                            .padding(.bottom, 10)
                            .font(.custom("Lato-Bold", size: 20))
                            .foregroundColor(Color(hex: "373737"))
                        
                        Text("\(modelData.cardPacks[cardPackIndex].packDescription)")
                            .font(.custom("Lato-Regular", size: 16))
                            .foregroundColor(Color(hex: "636363"))
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .frame(width: 400, height: 157)
            }
        }
        .frame(height: 157)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct CardPackItemView_Previews: PreviewProvider {
    static var previews: some View {
        CardPackItemView(cardPackIndex: 0)
            .environmentObject(ModelData())
    }
}
