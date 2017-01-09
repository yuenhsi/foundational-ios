//
//  Forecast.swift
//  weather-cast
//
//  Created by Yuen Hsi Chang on 1/8/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class Forecast {
    
    var _dayOfWeek: String!
    var _weather: String!
    var _high: String!
    var _low: String!
    
    var dayOfWeek: String {
        if _dayOfWeek == nil {
            _dayOfWeek = ""
        }
        return _dayOfWeek
    }
    
    var weather: String {
        if _weather == nil {
            _weather = ""
        }
        return _weather
    }
    
    var high: String {
        if _high == nil {
            _high = ""
        }
        return _high
    }
    
    var low: String {
        if _low == nil {
            _low = ""
        }
        return _low
    }
    
    init(jsonData: Dictionary<String, AnyObject>) {
        if let temp = jsonData["temp"] as? Dictionary<String, Double> {
            if let max = temp["max"] {
                _high = "\(kelvinToCelcius(kelvin: max))"
            }
            if let min = temp["min"] {
                _low = "\(kelvinToCelcius(kelvin: min))"
            }
        }
        
        if let weather = jsonData["weather"] as? [Dictionary<String, AnyObject>] {
            _weather = weather[0]["main"] as? String
        }
        
        if let dt = jsonData["dt"] as? Double {
            _dayOfWeek = Date(timeIntervalSince1970: dt).dayOfTheWeek()
        }
        print("highlows: \(_high), \(_low); weather: \(_weather); dayofweek: \(_dayOfWeek)")
    }
    
    func kelvinToCelcius(kelvin: Double) -> Double {
        return kelvin - 273
    }
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
