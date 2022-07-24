//
//  WeatherListTableViewController.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/11.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        if let value = UserDefaults.standard.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
}

extension WeatherListTableViewController {
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else {
            return UITableViewCell()
        }
        let weatherViewModel = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherViewModel)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSqgueForAddWeatherCityViewController(segue: segue)
        }
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsTableViewController") as? SettingsTableViewController else {
            return print("오류")
        }

        vc.delegate = self
        
    }
    
    func prepareSqgueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityViewController = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        addWeatherCityViewController.delegate = self
    }
    
}

extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(viewModel)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(viewModel: SettingsViewModel) {
        if lastUnitSelection.rawValue != viewModel.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: viewModel.selectedUnit.rawValue)
        }
    }
}
