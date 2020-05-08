//
//  Album.swift
//  iOSAlbums
//
//  Created by Stephanie Ballard on 5/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct Album: Codable {
    let artist: String
    let coverArt: [CoverArt]
    let genres: [String]
    let id: String
    let name: String
    let songs: [Song]
}

struct CoverArt: Codable {
    let url: String
}

struct Song: Codable {
    let duration: Duration
    let id: String
    let name: Name
}

struct Duration: Codable {
    let duration: String
}

struct Name: Codable {
    let title: String
}
