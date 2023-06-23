//
//  MyBookRow.swift
//  BookSight
//
//  Created by Adrián Castilla on 23/6/23.
//

import SwiftUI

struct MyBookRow: View {
    
    let book: BookDetails
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if book.volumeInfo.imageLinks?.thumbnail != nil {
                AsyncImage(url: URL(string: book.volumeInfo.imageLinks!.thumbnail))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 10)
            } else {
                Image(systemName: "character.book.closed.fill")
            }
            
            Text(book.volumeInfo.title)
                .font(.title)
                .bold()
            
            if book.volumeInfo.authors != nil {
                ForEach(book.volumeInfo.authors!, id: \.self) { author in
                    Text(author)
                        .font(.caption)
                }
            }
            
        }
        //.padding(.horizontal)
        
    }
}
