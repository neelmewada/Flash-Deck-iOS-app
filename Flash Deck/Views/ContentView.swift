//
//  ContentView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var cardPackIndex: Int = 0
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("All Card Packs")
                        .font(.custom("Lato-Regular", size: 24))
                        .foregroundColor(Color(hex: "373737"))
                }
                
                GeometryReader { geometry in
                    NavigationLink(destination: BurgerMenuView()) {
                        Image("hamburger-menu")
                            .resizable()
                            .frame(width: 26, height: 17)
                    }
                    .position(x: geometry.size.width, y: -16)
                }
                .padding(.leading, 25)
                .padding(.trailing, 25)
                .padding(.bottom, 25)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 0)
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(0..<modelData.cardPacks.count) { i in
                            NavigationLink(destination: FlashCardMainView(cardPackIndex: i)) {
                                CardPackItemView(cardPackIndex: i)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
