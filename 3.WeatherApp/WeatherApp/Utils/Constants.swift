//
//  Constance.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/14.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            let unit = userDefaults.value(forKey: "unit") as? String ?? "imperial"
            
            let appid = Bundle.main.apiKey
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.excaped())&appid=\(appid)&units=\(unit)")!
            
        }
    }
}
