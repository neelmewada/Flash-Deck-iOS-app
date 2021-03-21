//
//  HomeTabView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 15/03/21.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selection: Tab = .userpacks
    @State private var offset: CGFloat = 0
    
    private static var tabBtnActive = Color.white
    private static var tabBtnInactive = Color(hex: "373737")
    
    enum Tab {
        case userpacks
        case storepacks
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    UserCardPacksView()
                        .offset(x: -offset * UIScreen.main.bounds.width)
                    Text("Store Page")
                        .frame(width: UIScreen.main.bounds.width)
                        .offset(x: (1.0 - offset) * UIScreen.main.bounds.width)
                }
                
                Spacer()
                
                HStack {
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 0.0)
                            .fill(Color.black)
                            .frame(width: geometry.size.width / 2, height: geometry.size.height)
                            .offset(x: offset * geometry.size.width / 2)
                        
                        Button(action: {
                            self.selection = .userpacks
                            self.offset = 0.0
                        }) {
                            RoundedRectangle(cornerRadius: 0.0)
                                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.01))
                                .overlay(
                                    VStack {
                                        Image("card")
                                            .colorMultiply((selection == .userpacks) ? Self.tabBtnActive : Self.tabBtnInactive)
                                            
                                        Text("Your Cards")
                                            .font(.custom("Lato-Regular", size: 14))
                                            .foregroundColor((selection == .userpacks) ? Self.tabBtnActive : Self.tabBtnInactive)
                                            
                                    }
                                )
                                .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        }
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        //.background((selection == .userpacks) ? Color.black : Color.white)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: geometry.size.width / 4, y: geometry.size.height / 2)
                        
                        Button(action: {
                            self.selection = .storepacks
                            self.offset = 1.0
                        }) {
                            RoundedRectangle(cornerRadius: 0.0)
                                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.01))
                                .overlay(
                                    VStack {
                                        Image("store")
                                            .colorMultiply((selection == .storepacks) ? Self.tabBtnActive : Self.tabBtnInactive)
                                            
                                        Text("Marketplace")
                                            .font(.custom("Lato-Regular", size: 14))
                                            .foregroundColor((selection == .storepacks) ? Self.tabBtnActive : Self.tabBtnInactive)
                                            
                                    }
                                )
                                .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        }
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        //.background((selection == .storepacks) ? Color.black : Color.white)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: geometry.size.width * 3 / 4, y: geometry.size.height / 2)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 70)
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .environmentObject(ModelData())
    }
}
