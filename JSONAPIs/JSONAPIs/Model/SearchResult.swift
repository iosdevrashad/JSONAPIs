//
//  SearchResult.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/27/23.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [AppsResult]
}

struct AppsResult: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String? // App Icon
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
