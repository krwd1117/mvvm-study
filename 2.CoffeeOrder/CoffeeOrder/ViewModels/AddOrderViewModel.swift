//
//  AddOrderViewModel.swift
//  CoffeeOrder
//
//  Created by Jeongwan Kim on 2022/05/07.
//

import Foundation

struct AddOrderViewModel {
    
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map {
            $0.rawValue.capitalized
        }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map {
            $0.rawValue.capitalized
        }
    }
    
}

