//
//  MovieDTO.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation

struct MovieResponse: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [ArtistResult]
}

struct Author: Codable {
    let name: String
    let uri: String
}

struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
}

struct ArtistResult: Codable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
    let artistId: String?
    let artistUrl: String?
}

struct Genre: Codable {
    let genreId: String
    let name: String
    let url: String
}

