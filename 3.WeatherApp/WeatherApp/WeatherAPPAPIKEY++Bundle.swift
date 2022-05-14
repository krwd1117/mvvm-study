//
//  WeatherAPPAPIKEY++Bundle.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/14.
//

import Foundation

extension Bundle {
  var apiKey: String {
    guard let file = self.path(forResource: "APIKEYS", ofType: "plist") else { return ""}
    
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
    guard let key = resource["WEATHERAPIKEY"] as? String else { fatalError("APIKEYS에 API_KEY를 입력해주세요/")}
    return key
  }
}
