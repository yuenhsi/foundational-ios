
import Foundation

let URL_PREFIX = "http://api.openweathermap.org/data/2.5/weather?"
let API_KEY = "&appid=06a45623d789858a42056a96f8d08723"
let LATITUTE = "lat="
let LONGTITUDE = "&lon="

let URL_STRING = "\(URL_PREFIX)\(LATITUTE)35\(LONGTITUDE)139\(API_KEY)"
let FORECAST_URL_STRING = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&mode=json&appid=06a45623d789858a42056a96f8d08723"

typealias DownloadComplete = () -> ()
