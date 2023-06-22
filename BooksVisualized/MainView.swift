//
//  MainView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 23/6/23.
//

import SwiftUI

struct MainView: View {
    
    @State var selected = 1
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            ContentView(selected: .allBooks)
                .tabItem { Label("Search books", systemImage: "magnifyingglass") }
                .tag(1)
            
            ContentView(selected: .favourites)
                .tabItem { Label("Favourites", systemImage: "star") }
                .tag(2)
            
        }
        .environmentObject(viewModel)
        
    }
}

#Preview {
    MainView()
}
