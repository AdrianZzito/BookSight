//
//  FavouritesView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 23/6/23.
//

import SwiftUI

struct FavouritesView: View {
    
    @State var search = ""
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationSplitView {
            VStack {
                
                List {
                    
                    ForEach(viewModel.favouritedBooks, id: \.self) { book in
                        NavigationLink(value: book) {
                            BookRowView(book: book)
                        }
                    }
                    
                }
                .searchable(text: $search)
                
            }
            .navigationTitle("Favourites")
            .navigationDestination(for: BookDetails.self) { book in
                BookDetailedView(book: book)
            }
            
        } detail: {
            Text("Search and select a book to view it's details.")
        }
        .environmentObject(viewModel)
        
    }
    
}

#Preview {
    FavouritesView()
}
