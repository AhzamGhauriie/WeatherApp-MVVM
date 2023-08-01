//
//  RightNowView.swift
//  WeatherApp
//
//  Created by Ahzam Ghori on 01/08/2023.
//

import UIKit

class RightNowView: UIView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    func clear() {
        dateLabel.text = ""
        cityLabel.text = ""
        weatherLabel.text = ""
        windSpeedLabel.text = ""
        humidityLabel.text = ""
        weatherImage.image = nil
    }
    
    func updateView(currentWeather: Current, city: String) {
        cityLabel.text = city
        dateLabel.text = Date.getTodaysDate()
        windSpeedLabel.text = "Wind Speed: \(currentWeather.wind_speed) km/h"
        humidityLabel.text = "Humidity: \(currentWeather.humidity)%"
        weatherLabel.text = currentWeather.weather[0].description.capitalized
        weatherImage.image = UIImage(named: "sun")
    }

}
