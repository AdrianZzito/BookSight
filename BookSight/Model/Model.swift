//
//  Model.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import Foundation

// MARK: - Windows
enum windows: CaseIterable {
    case allBooks
    case favourites
}

// MARK: - Books
struct Books: Codable, Hashable {
    let kind: String
    let totalItems: Int
    var items: [BookDetails]
}

// MARK: - BookDetails
struct BookDetails: Codable, Hashable {
    let id: String
    let selfLink: String
    var volumeInfo: VolumeInfo
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable, Hashable {
    let title: String
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let pageCount: Int?
    var readenPages: Int?
    let categories: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
    let allowAnonLogging: Bool
    let contentVersion: String
    let imageLinks: ImageLinks?
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let publisher: String?
    let subtitle: String?
}


// MARK: - ImageLinks
struct ImageLinks: Codable, Hashable {
    let smallThumbnail, thumbnail: String
}
