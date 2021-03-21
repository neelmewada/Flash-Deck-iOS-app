//
//  FlashCardView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import SwiftUI

/// A view that represents a single face of a Flash Card. Used to display both front and back face
struct FlashCardFace: View {
    @Binding var flipped: Bool
    
    var color: Color
    var text: String
    var cardNumber: String
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .frame(width: 300, height: 400)
            .padding(30)
            .overlay(
                GeometryReader { geometry in
                    Text(cardNumber)
                        .font(.custom("Lato-Light", size: 56, relativeTo: .headline))
                        .foregroundColor(.white)
                        .position(x: 65, y: 65)
                    Text(text)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.custom("Lato-Regular", size: 24))
                        .position(x: geometry.size.width / 2 - 40, y: geometry.size.height / 2 - 20)
                        .padding(30)
                        .padding(.leading, 10)
                }
            )
            .padding(.top, 10)
            .padding(.bottom, 20)
    }
}

/// A view that represents a singular Flash Card.
/// It manages both the front and back face of each card
struct FlashCardView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var flipped = false
    
    var card:FlashCard
    var cardNumber: Int
    var frontColor: Color
    var backColor: Color
    
    static var primaryCardColor = Color(hex: "65dcff")
    static var backCardColor = Color(hex: "373737")
    static var secondaryCardColor = Color(hex: "636363")
    static var shadowOn = Color(red: 0, green: 0, blue: 0, opacity: 0.15)
    static var shadowOff = Color(red: 0, green: 0, blue: 0, opacity: 0)
    
    var body: some View {
        ZStack {
            FlashCardFace(flipped: self.$flipped, color: self.backColor, text: card.answer, cardNumber: String(cardNumber))
                .opacity(flipped ? 1.0 : 0)
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 10, y: 0, z: 0)
                )
            FlashCardFace(flipped: self.$flipped, color: self.frontColor, text: card.question, cardNumber: String(cardNumber))
                .opacity(flipped ? 0 : 1.0)
        }
        .rotation3DEffect(
            self.flipped ? Angle(degrees: 180) : Angle(degrees: 0),
            axis: (x: 10, y: 0, z: 0)
        )
        .animation(.default)
        .onTapGesture {
            self.flipped.toggle()
        }
    }
}

struct FlashCardView_Previews: PreviewProvider {
    private static var modelData = ModelData()
    
    static var previews: some View {
        FlashCardView(card: modelData.cardPacks[1].cards[0], cardNumber: 2, frontColor: FlashCardView.primaryCardColor, backColor: FlashCardView.backCardColor)
            .environmentObject(modelData)
    }
}
