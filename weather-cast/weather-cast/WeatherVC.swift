//
//  ViewController.swift
//  weather-cast
//
//  Created by Yuen Hsi Chang on 1/7/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecasts = [Forecast]()
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        getLocation()
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.getForecastData {
                self.updateUI()
            }
        }
    }
    
    func getLocation() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            let currentLocation = locationManager.location
            Location.sharedInstance.longitude = currentLocation?.coordinate.longitude
            Location.sharedInstance.latitude = currentLocation?.coordinate.latitude
        } else {
            locationManager.requestWhenInUseAuthorization()
            getLocation()
        }
    }
    
    func getForecastData(completed: @escaping DownloadComplete) {
        let url = URL(string: FORECAST_URL_STRING)!
        Alamofire.request(url).responseJSON { response in
            if let JSON = response.result.value {
                if let forecastDict = JSON as? Dictionary<String, AnyObject> {
                    if let list = forecastDict["list"] as? [Dictionary<String, AnyObject>] {
                        for item in list {
                            let forecast = Forecast(jsonData: item)
                            self.forecasts.append(forecast)
                        }
                    }
                }
            }
            completed()
        }
    }
    
    func updateUI() {
        dateLabel.text = currentWeather.date
        tempLabel.text = "\(currentWeather.temperature)"
        locationLabel.text = currentWeather.cityName
        weatherLabel.text = currentWeather.weather
        weatherImage.image = UIImage(named: currentWeather.weather)
        weatherTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let weatherCell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            weatherCell.updateUI(forecast: forecasts[indexPath.row])
            return weatherCell
        } else {
            return WeatherCell()
        }
    }
    
}

