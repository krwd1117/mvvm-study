//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/11.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func saveCityButtonTapped() {
        
        if let city = cityNameTextField.text {
            guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=07c19f8b04264f1bf6aeb840a5f8e47d&units=imperial") else { return }
            
            // Resource<T>는 데이터가 반환될때 받을 모델
            let weatherResource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            
            WebService().load(resource: weatherResource) { result in
//                 return result
            }
            
        }
        
    }
    
    @IBAction func close() {
        dismiss(animated: true)
    }
    
}
