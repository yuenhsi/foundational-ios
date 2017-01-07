//
//  PartyRock.swift
//  party-rock
//
//  Created by Yuen Hsi Chang on 1/6/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import Foundation

class PartyRock {
    
    private var _songTitle: String!
    private var _songImageURL: String!
    private var _songVideoURL: String!
    
    var songTitle: String {
        return _songTitle
    }
    
    var songImageURL: String {
        return _songImageURL
    }
    
    var songVideoURL: String {
        return _songVideoURL
    }
    
    init(songTitle: String, songImageURL: String, songVideoURL: String) {
        _songTitle = songTitle
        _songImageURL = songImageURL
        _songVideoURL = songVideoURL
    }
}
