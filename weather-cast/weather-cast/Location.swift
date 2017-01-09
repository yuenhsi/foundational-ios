//
//  Location.swift
//  weather-cast
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import MapKit

class Location {
    
    static var sharedInstance = Location()
    
    var latitude: Double!
    var longitude: Double!
    
    private init() {
        
    }
    
}
