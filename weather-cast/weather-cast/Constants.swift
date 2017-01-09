
import Foundation

let API_KEY = "06a45623d789858a42056a96f8d08723"

let URL_STRING = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"
let FORECAST_URL_STRING = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=\(API_KEY)"

typealias DownloadComplete = () -> ()
