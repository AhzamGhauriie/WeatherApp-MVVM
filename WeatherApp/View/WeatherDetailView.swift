//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Ahzam Ghori on 01/08/2023.
//

import UIKit

class WeatherDetailView: UIView {

    @IBOutlet weak var topLabel1: UILabel!
    @IBOutlet weak var topLabel2: UILabel!
    @IBOutlet weak var topLabel3: UILabel!
    @IBOutlet weak var topLabel4: UILabel!
    @IBOutlet weak var topLabel5: UILabel!
    @IBOutlet weak var topLabel6: UILabel!
    @IBOutlet weak var topLabel7: UILabel!
    
    @IBOutlet weak var midLabel1: UILabel!
    @IBOutlet weak var midLabel2: UILabel!
    @IBOutlet weak var midLabel3: UILabel!
    @IBOutlet weak var midLabel4: UILabel!
    @IBOutlet weak var midLabel5: UILabel!
    @IBOutlet weak var midLabel6: UILabel!
    @IBOutlet weak var midLabel7: UILabel!
    
    @IBOutlet weak var bottomLabel1: UILabel!
    @IBOutlet weak var bottomLabel2: UILabel!
    @IBOutlet weak var bottomLabel3: UILabel!
    @IBOutlet weak var bottomLabel4: UILabel!
    @IBOutlet weak var bottomLabel5: UILabel!
    @IBOutlet weak var bottomLabel6: UILabel!
    @IBOutlet weak var bottomLabel7: UILabel!
    
    func clear() {
        let labels = [
            topLabel1, topLabel2, topLabel3, topLabel4, topLabel5, topLabel6, topLabel7,
            midLabel1, midLabel2, midLabel3, midLabel4, midLabel5,midLabel6, midLabel7,
            bottomLabel1, bottomLabel2, bottomLabel3, bottomLabel4, bottomLabel5, bottomLabel6, bottomLabel7
        ]
        
        for label in labels {
            label?.text = ""
        }
    }
    
    func updateViewForWeekly(_ daily: [Daily]) {
        updateDays(daily: daily)
    }
        
    func updateDays(daily: [Daily]) {
        let topLabels = [topLabel1, topLabel2, topLabel3, topLabel4, topLabel5, topLabel6, topLabel7]
        let midLabels = [midLabel1, midLabel2, midLabel3, midLabel4, midLabel5, midLabel6, midLabel7]
        let bottomLabels = [bottomLabel1, bottomLabel2, bottomLabel3, bottomLabel4, bottomLabel5, bottomLabel6, bottomLabel7]
        
        for i in 0...6 {
            
            let day = daily[i + 1]
            let date = Date(timeIntervalSince1970: Double(day.dt))
            let dayString = Date.getDayOfWeekFrom(date: date)
            let weatherIconName = day.weather[0].icon
            let weatherTemperature = day.temp.day
            
            topLabels[i]?.text = dayString
            midLabels[i]?.text = day.weather[0].description
            bottomLabels[i]?.text = "\(Int(weatherTemperature.rounded()))°F"
        }
    }
}
