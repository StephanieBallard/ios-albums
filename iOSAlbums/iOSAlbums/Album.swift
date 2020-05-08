//
//  Album.swift
//  iOSAlbums
//
//  Created by Stephanie Ballard on 5/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct Album: Codable {
    var artist: String
    var id: String
    var name: String
    var coverArt: [URL]
    var genres: [String]
    var songs: [Song]

    enum AlbumKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs

        enum GenresKeys: String, CodingKey {
            case genres
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        artist = try container.decode(String.self, forKey: .artist)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)

        var genresContainer = try container.nestedUnkeyedContainer(forKey: .genres)
        var genreNames: [String] = []

        while genresContainer.isAtEnd == false {
            let genreContainer = try genresContainer.nestedContainer(keyedBy: CodingKeys.GenresKeys.self)

        }


    }
}


struct Song: Codable {
    var duration: String
    var id: String
    var name: String
}







//struct Album: Codable {
//    var artist: String
//    var coverArt: [CoverArt]
//    var genres: [String]
//    var id: String
//    var name: String
//    var songs: [Song]
//}
//
//struct CoverArt: Codable {
//    let url: String
//}
//
//struct Song: Codable {
//    let duration: Duration
//    let id: String
//    let name: Name
//}
//
//struct Duration: Codable {
//    let duration: String
//}
//
//struct Name: Codable {
//    let title: String
//}
//
