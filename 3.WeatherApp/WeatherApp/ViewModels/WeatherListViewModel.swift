//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/14.
//

import Foundation

class WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ viewModel: WeatherViewModel) {
        weatherViewModels.append(viewModel)
    }
    
    func numberOfRows(_ sectionP: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
        weatherViewModels = weatherViewModels.map { viewModel in
            let weatherModel = viewModel
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { viewModel in
            let weatherModel = viewModel
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }

}

class WeatherViewModel {
    
    var weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
    
}
