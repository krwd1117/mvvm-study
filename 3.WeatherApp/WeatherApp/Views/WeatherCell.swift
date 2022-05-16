//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/11.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureSkeleton()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func configure(_ viewModel: WeatherViewModel) {
        self.cityNameLabel.text = viewModel.city
        self.temperatureLabel.text = "\(viewModel.temperature.formatAsDegree())"
    }    
}
