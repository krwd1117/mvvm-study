//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/11.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    private var addWeatherViewModel = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func saveCityButtonTapped() {
        
        if let city = cityNameTextField.text {
         
            addWeatherViewModel.addWeather(for: city) { weatherViewModel in
                self.delegate?.addWeatherDidSave(viewModel: weatherViewModel)
                self.dismiss(animated: true)
            }
            
        }
        
    }
    
    @IBAction func close() {
        dismiss(animated: true)
    }
    
}
