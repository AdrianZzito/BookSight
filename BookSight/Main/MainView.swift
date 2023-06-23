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
            
            ContentView()
                .tabItem { Label("Search books", systemImage: "magnifyingglass") }
                .tag(1)
            
            FavouritesView()
                .tabItem { Label("Favourites", systemImage: "star") }
                .tag(2)
            
            MyBooksView()
                .tabItem { Label("My books", systemImage: "books.vertical") }
                .tag(3)
            
        }
        .environmentObject(viewModel)
        
    }
}

#Preview {
    MainView()
}
