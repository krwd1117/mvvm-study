//
//  Weather.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/14.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
    let name: String
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
