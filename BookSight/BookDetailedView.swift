//
//  BookDetailedView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import SwiftUI

struct BookDetailedView: View {
    
    var book: BookDetails
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var readenPages = 0
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack {
                    
                    Text(book.volumeInfo.title)
                        .font(.title)
                        .bold()
                    
                    if book.volumeInfo.authors != nil {
                        ForEach(book.volumeInfo.authors!, id: \.self) { author in
                            Text(author)
                                .font(.subheadline)
                            
                        }
                    }
                    
                }
                
                if book.volumeInfo.imageLinks?.thumbnail != nil {
                    AsyncImage(url: URL(string: book.volumeInfo.imageLinks!.thumbnail))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .padding(.trailing, 10)
                } else {
                    Image(systemName: "character.book.closed.fill")
                        .resizable()
                        .frame(width: 85, height: 100)
                        .padding(.leading)
                }
                
            }
            
            Divider()
            
            Form {
                
                if book.volumeInfo.publishedDate != nil {
                    Text("Published date: \(book.volumeInfo.publishedDate!)")
                }
                
                if book.volumeInfo.description != nil {
                    Text("Description: \(book.volumeInfo.description!)")
                }
                
                if book.volumeInfo.pageCount != nil {
                    Text("Page count: \(book.volumeInfo.pageCount!)")
                }
                
                if book.volumeInfo.averageRating != nil {
                    Text("Average rating: \(book.volumeInfo.averageRating!)")
                }
                
                Link("Book link (Google books)", destination: URL(string: book.volumeInfo.canonicalVolumeLink)!)
                    .foregroundStyle(.teal)
                
            }
            
        }
        .navigationTitle(book.volumeInfo.title)
        .toolbar {
            
            ToolbarItem(placement: .bottomOrnament) {
                Button {
                    if viewModel.favouritedBooks.contains(book) {
                        viewModel.removeFavourite(withID: book)
                    } else {
                        viewModel.saveFavourites(book: book)
                    }
                } label: {
                    Label("Favourite", systemImage: viewModel.favouritedBooks.contains(book) ? "star.fill":"star")
                }
                .help("Add to favourites")
            }
            
            ToolbarItem(placement: .bottomOrnament) {
                Button {
                    if viewModel.myBooks.contains(book) {
                        viewModel.removeMyBook(withID: book)
                    } else {
                        viewModel.saveMyBooks(book: book)
                    }
                } label: {
                    Image(systemName: viewModel.myBooks.contains(book) ? "books.vertical.fill":"books.vertical")
                }
                .help("Add to my books")
            }
            
            if book.volumeInfo.pageCount != nil {
                if viewModel.myBooks.contains(book) {
                    
                    ToolbarItem(placement: .bottomOrnament) {
                        Divider()
                    }
                    
                    ToolbarItem(placement: .bottomOrnament) {
                        Picker("Readen pages", selection: $readenPages) {
                            ForEach(0..<book.volumeInfo.pageCount! + 1) {
                                Text("\($0)")
                            }
                        }
                        .help("Readen pages")
                    }
                    
                }
            }
            
        }
        .animation(.bouncy)
        
    }
}
