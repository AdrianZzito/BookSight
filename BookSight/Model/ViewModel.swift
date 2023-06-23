//
//  ViewModel.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import Foundation
import SwiftUI
import Observation

final class ViewModel: ObservableObject {
    
    @Published var myBooks: [BookDetails] = []
    @Published var favouritedBooks: [BookDetails] = []
    @Published var completedBooks: [BookDetails] = []
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
    
    
    // MARK: - Favourites
    
    func encodeAndSaveFavourites() {
        if let encoded = try? JSONEncoder().encode(favouritedBooks) {
            UserDefaults.standard.set(encoded, forKey: "favouritedBooks")
        }
    }
    
    func saveFavourites(book: BookDetails) {
        favouritedBooks.insert(book, at: 0)
        print(favouritedBooks)
        encodeAndSaveFavourites()
    }
    
    func removeFavourite(withID book: BookDetails) {
        favouritedBooks.removeAll(where: { $0.id == book.id })
        encodeAndSaveFavourites()
    }
    
    // MARK: - My Books
    
    func encodeAndSaveMyBooks() {
        if let encoded = try? JSONEncoder().encode(myBooks) {
            UserDefaults.standard.set(encoded, forKey: "myBooks")
        }
    }
    
    func saveMyBooks(book: BookDetails) {
        myBooks.insert(book, at: 0)
        print(myBooks)
        encodeAndSaveMyBooks()
    }
    
    func removeMyBook(withID book: BookDetails) {
        myBooks.removeAll(where: { $0.id == book.id })
        encodeAndSaveMyBooks()
    }
    
    func updateReadenPages(book: Binding<BookDetails>, readenPages: Int) {
        book.wrappedValue.volumeInfo.readenPages = readenPages
        encodeAndSaveMyBooks()
    }
    
}
