//
//  AppGroup.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/30/23.
//

import Foundation

struct AppGroup: Codable {
    let feed: Feed
    
}

struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let name, artistName, artworkUrl100: String
}
