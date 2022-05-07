//
//  WebService.swift
//  NewsApp
//
//  Created by Jeongwan Kim on 2022/05/05.
//

import Foundation
import UIKit

class WebService {
    //    func getArticles(url: URL, completion: @escaping ([Article]?) -> Void) {
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //            print("URLSession")
    //            if let error = error {
    //                print(error.localizedDescription)
    //            } else if let data = data {
    //                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
    //                print("articleList > ", articleList)
    //                if let articleList = articleList {
    //                    completion(articleList.articles)
    //                }
    //            }
    //        }.resume()
    //    }
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) // if any error occurs, article can be nil
                
            }else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
            
        }.resume()
    }
}
