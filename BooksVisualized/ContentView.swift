//
//  ContentView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {

    @State var bookName = ""
    @State var selected: windows = .allBooks
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationSplitView {
            VStack {
                
                if selected == .allBooks {
                    TextField("Enter a book name", text: $bookName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .onSubmit {
                            Task {
                                await viewModel.getBooks(book: bookName)
                            }
                        }
                    
                    Spacer()
                }
                
                List {
                    
                    ForEach(selected == .allBooks ? viewModel.booksFounded:viewModel.favouritedBooks, id: \.self) { book in
                        NavigationLink(value: book) {
                            BookRowView(book: book)
                        }
                    }
                    
                }
                
            }
            .navigationTitle(selected == .allBooks ? "Books":"Favourites")
            .navigationDestination(for: BookDetails.self) { book in
                BookDetailedView(book: book)
            }
            .toolbar {
                WindowSelectorView(selectedValue: $selected)
            }
            
        } detail: {
            Text("Search and select a book to view it's details.")
        }
        
        .alert("ERROR: Book not found", isPresented: $viewModel.error) {
            Button("Ok", role: .none) {}
        }
        .environmentObject(viewModel)
        
    }
}

#Preview {
    ContentView()
}
