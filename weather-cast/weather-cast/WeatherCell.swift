//
//  WeatherCell.swift
//  weather-cast
//
//  Created by Yuen Hsi Chang on 1/8/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    func updateUI(forecast: Forecast) {
        dayLabel.text = forecast._dayOfWeek
        highLabel.text = forecast._high
        lowLabel.text = forecast._low
        weatherLabel.text = forecast._weather
        weatherImage.image = UIImage(named: forecast._weather)
    }

}
