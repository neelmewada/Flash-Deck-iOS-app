//
//  FlashCardMainView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 13/03/21.
//

import SwiftUI



struct FlashCardMainView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData: ModelData
    
    var cardPackIndex: Int
    
    var body: some View {
        VStack {
            Text("\(modelData.cardPacks[cardPackIndex].packName)")
                .font(.custom("Lato-Regular", size: 24))
                .foregroundColor(Color(hex: "373737"))
            
            GeometryReader { geometry in
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.modelData.curIndexGlobal = 0
                }) {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 32, height: 16)
                }
                .position(x: 0, y: -16)
                
                NavigationLink(destination: BurgerMenuView()) {
                    Image("hamburger-menu")
                        .resizable()
                        .frame(width: 26, height: 17)
                }
                .position(x: geometry.size.width, y: -16)
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .padding(.bottom, 25)
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 0)
            
            Spacer()
            
            FlashCardList(cardPackIndex: cardPackIndex)
                .padding(.top, 30)
            
            Spacer()
            HStack {
                CardCounter(cardPackIndex: cardPackIndex)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("+")
                        .font(.system(size: 42))
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color(hex: "373737"))
                        .clipShape(Circle())
                }
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FlashCardMainView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardMainView(cardPackIndex: 0)
            .environmentObject(ModelData())
    }
}
