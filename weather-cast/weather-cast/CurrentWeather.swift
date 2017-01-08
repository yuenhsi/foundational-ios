import UIKit
import Alamofire

class CurrentWeather {
    
    var _date: String!
    var _temperature: Double!
    var _cityName: String!
    var _weather: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        return _date
    }
    
    var temperature: Double {
        if _temperature == nil {
            _temperature = 0.0
        }
        return _temperature
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weather: String {
        
        if _weather == nil {
            _weather = ""
        }
        return _weather
    }
    
}
