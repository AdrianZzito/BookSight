//
//  Model.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import Foundation

// MARK: - Books
struct Books: Codable, Hashable {
    let kind: String
    let totalItems: Int
    let items: [BookDetails]
}

// MARK: - BookDetails
struct BookDetails: Codable, Hashable {
    let id: String
    let selfLink: String
    let volumeInfo: VolumeInfo
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable, Hashable {
    let title: String
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let pageCount: Int?
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
