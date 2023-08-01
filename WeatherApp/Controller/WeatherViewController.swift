//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Ahzam Ghori on 01/08/2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var rightNowView: RightNowView!
    @IBOutlet weak var weatherDetailView: WeatherDetailView!
    
    var weatherResult: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        getWeather()
    }
    
    func clearAll() {
        rightNowView.clear()
        weatherDetailView.clear()
    }
    
    func getWeather() {
        NetworkService.shared.getWeather(onSuccess: { (result) in
            self.weatherResult = result
            
            self.weatherResult?.sortDailyArray()
            self.weatherResult?.sortHourlyArray()
            
            self.updateViews()
            
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
    
    func updateViews() {
        updateTopView()
        updateBottomView()
        getWeather()
    }
    
    func updateTopView() {
        guard let weatherResult = weatherResult else {
            return
        }
        
        rightNowView.updateView(currentWeather: weatherResult.current, city: weatherResult.timezone)
    }
    
    func updateBottomView() {
        guard let weatherResult = weatherResult else {
            return
        }
        
        weatherDetailView.updateViewForWeekly(weatherResult.daily)
    }
    
}
