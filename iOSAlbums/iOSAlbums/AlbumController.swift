//
//  AlbumController.swift
//  iOSAlbums
//
//  Created by Stephanie Ballard on 5/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class AlbumController {
    
    var albums: [Album]?
    
    //TODO: A baseURL: URL property. Create or use an existing Firebase Database for the base URL.
    
    func testDecodingExampleAlbum() {
        let urlPath = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json")
    }
    
    func testEncodingExampleAlbum(){
        let urlPath = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json")
    }
    
    let baseURL = URL(string: "https://albums-4d36d.firebaseio.com/")!
    
    func getAlbums() {
        
    }
}
