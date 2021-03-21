//
//  UserCardPacksView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 15/03/21.
//

import SwiftUI

/// Main Cards Pack View that is displayed on the Home screen
struct UserCardPacksView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Card Packs")
                    .font(.custom("Lato-Regular", size: 24))
                    .foregroundColor(Color(hex: "373737"))
            }
            
            GeometryReader { geometry in
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
            let screenWidth: CGFloat = 400.0
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(0..<modelData.cardPacks.count, id: \.self) { i in
                        NavigationLink(destination: FlashCardMainView(cardPackIndex: i)) {
                            CardPackItemView(cardPackIndex: i, width: screenWidth)
                                .padding(.bottom, 40)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 30, x: 0, y: 10)
                        }
                    }
                }
                .padding(.top, 20)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct UserCardPacksView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardPacksView()
            .environmentObject(ModelData())
    }
}
