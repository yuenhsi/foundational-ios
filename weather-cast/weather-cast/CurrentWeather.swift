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
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        print(URL_STRING)
        let weatherURL = URL(string: URL_STRING)!
        Alamofire.request(weatherURL).responseJSON { response in
            if let JSON = response.result.value {
                if let weatherDict = JSON as? Dictionary<String, AnyObject> {
                    if let city = weatherDict["name"] as? String {
                        self._cityName = city
                        print("cityName: \(self._cityName)")
                    }
                    if let main = weatherDict["main"] as? Dictionary<String, Double> {
                        if var temperature = main["temp"] {
                            temperature = self.kelvinToCelcius(kelvin: temperature)
                            self._temperature = temperature
                            print("temperature: \(self._temperature)")
                        }
                    }
                    if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
                        if let main = weather[0]["main"] as? String {
                            self._weather = main
                            print("weather: \(self._weather)")
                        }
                    }
                }
            }
            completed()
        }
    }
    
    func kelvinToCelcius(kelvin: Double) -> Double {
        return kelvin - 273
    }
    
}
