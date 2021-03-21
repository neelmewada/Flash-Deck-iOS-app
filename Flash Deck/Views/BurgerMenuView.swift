//
//  BurgerMenuView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 13/03/21.
//

import SwiftUI

struct BurgerMenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData: ModelData
    @State private var toggle: Bool = false
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.custom("Lato-Regular", size: 24))
                .foregroundColor(Color(hex: "373737"))
            
            GeometryReader { geometry in
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 32, height: 16)
                }
                .position(x: 0, y: -16)
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .padding(.bottom, 25)
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 0)
            
            List {
                Text("Option A")
                Text("Option B")
                Toggle("Toggle Option", isOn: $toggle)
                    .accentColor(Color(hex: "373737"))
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct BurgerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BurgerMenuView()
            .environmentObject(ModelData())
    }
}
