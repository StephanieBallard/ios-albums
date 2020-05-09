//
//  Album.swift
//  iOSAlbums
//
//  Created by Stephanie Ballard on 5/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import UIKit

struct Album: Codable {
    var artist: String
    var id: String
    var name: String
    var coverArt: [URL]
    var genres: [String]
    var songs: [Song]

    enum AlbumCodingKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs

        enum CoverArtCodingKeys: String, CodingKey {
            case url
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AlbumCodingKeys.self)
        artist = try container.decode(String.self, forKey: .artist)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        genres = try container.decode([String].self, forKey: .genres)
        songs = try container.decodeIfPresent([Song].self, forKey: .songs) ?? []
        
        var coverArtContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var coverArtURLS = [URL]()
        
        while !coverArtContainer.isAtEnd {
            let coverArtContentContainer = try coverArtContainer.nestedContainer(keyedBy: AlbumCodingKeys.CoverArtCodingKeys.self)
            let urlString = try coverArtContentContainer.decode(String.self, forKey: .url)
            if let url = URL(string: urlString) {
                coverArtURLS.append(url)
            }
        }
        self.coverArt = coverArtURLS
        }
    }

struct Song: Codable {
    var duration: String
    var id: String
    var name: String
    
    enum SongCodingKeys: String, CodingKey {
        case duration
        case name
        case id
    
        enum NameCodingKeys: String, CodingKey {
            case title
        }
        
        enum DurationCodingKeys: String, CodingKey {
            case duration
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SongCodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        
        let durationContainer = try container.nestedContainer(keyedBy: SongCodingKeys.DurationCodingKeys.self, forKey: .duration)
        duration = try durationContainer.decode(String.self, forKey: .duration)
        
        let nameContainer = try container.nestedContainer(keyedBy: SongCodingKeys.NameCodingKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .title)
        
    }
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
