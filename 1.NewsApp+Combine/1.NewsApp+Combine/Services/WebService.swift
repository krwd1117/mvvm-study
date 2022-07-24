//
//  WebService.swift
//  1.NewsApp+Combine
//
//  Created by Jeongwan Kim on 2022/07/24.
//

import Foundation
import Combine

enum API {
    case fetchArticle
    
    var url: URL {
        switch self {
        case .fetchArticle:
            return URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=<APIKEY>")!
        }
    }
}

struct WebService {
    
    static let shared = WebService()
    
    func fetchArticles() -> AnyPublisher<ArticleResponse, Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchArticle.url)
            .map { $0.data }
            .decode(type: ArticleResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
