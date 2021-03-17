//
//  ContentView.swift
//  Flash Deck
//
//  Created by Neel Mewada on 09/03/21.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            UserCardPacksView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
