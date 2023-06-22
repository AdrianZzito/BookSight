//
//  BookRowView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import SwiftUI

struct BookRowView: View {
    
    let book: BookDetails
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
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
                AsyncImage(url: URL(string: book.volumeInfo.imageLinks!.smallThumbnail))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(.leading)
            } else {
                Image(systemName: "character.book.closed.fill")
                    .resizable()
                    .frame(width: 85, height: 100)
                    .padding(.leading)
            }
            
        }
        
    }
}
