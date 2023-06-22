//
//  BookDetailedView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import SwiftUI

struct BookDetailedView: View {
    
    let book: BookDetails
    
    @EnvironmentObject var viewModel: ViewModel
    
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
                
                if book.volumeInfo.canonicalVolumeLink != nil {
                    Link("Book link (Google books)", destination: URL(string: book.volumeInfo.canonicalVolumeLink)!)
                        .foregroundStyle(.teal)
                }
                
            }
            
        }
        .navigationTitle(book.volumeInfo.title)
        .toolbar {
            
            Button {
                if viewModel.favouritedBooks.contains(book) {
                    viewModel.removeFavourite(withID: book)
                } else {
                    viewModel.saveFavourites(book: book)
                }
            } label: {
                Image(systemName: viewModel.favouritedBooks.contains(book) ? "star.fill":"star")
            }
            
        }
        
    }
}
