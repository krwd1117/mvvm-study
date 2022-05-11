//
//  WebService.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/11.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            print("data >>>>> ", data)
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
            
        }.resume()
    }
    
}
