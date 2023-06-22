//
//  ViewModel.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import Foundation
import SwiftUI


final class ViewModel: ObservableObject {
    
    @Published var favouritedBooks: [BookDetails] = []
    @Published var booksFounded: [BookDetails] = []
    @Published var error: Bool = false
    
    // let apiKey = "Enter here your google books API key"
    
    func getBooks(book: String) async {
        
        DispatchQueue.main.async {
            self.booksFounded = []
        }
        
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(book)&key=\(apiKey)")
        
        let (encodedBookResult, _) = try! await URLSession.shared.data(from: url!)
        let decodedBookResult = try! JSONDecoder().decode(Books.self, from: encodedBookResult)
        
        DispatchQueue.main.async {
            self.booksFounded = decodedBookResult.items
        }
            
        
    }
    
    func encodeAndSave() {
        if let encoded = try? JSONEncoder().encode(favouritedBooks) {
            UserDefaults.standard.set(encoded, forKey: "favouritedBooks")
        }
    }
    
    func saveFavourites(book: BookDetails) {
        favouritedBooks.insert(book, at: 0)
        print(favouritedBooks)
        encodeAndSave()
    }
    
    func removeFavourite(withID book: BookDetails) {
        favouritedBooks.removeAll(where: { $0.id == book.id })
        encodeAndSave()
    }
    
}
