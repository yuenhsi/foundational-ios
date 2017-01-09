//
//  ViewController.swift
//  weather-cast
//
//  Created by Yuen Hsi Chang on 1/7/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecasts = [Forecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.getForecastData {
                self.updateUI()
            }
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
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
}

