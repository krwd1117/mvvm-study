//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/14.
//

import Foundation

class WeatherListViewModel {

//    let weatherListViewModel:

}

class WeatherViewModel {
    
    let weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
    var city: String {
        return weather.name
    }
    
    var temperature: Double {
        return weather.main.temp
    }
    
    
}
