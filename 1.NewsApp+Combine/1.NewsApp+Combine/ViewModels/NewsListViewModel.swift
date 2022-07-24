//
//  NewsListViewModel.swift
//  1.NewsApp+Combine
//
//  Created by Jeongwan Kim on 2022/07/24.
//

import UIKit
import Combine

class NewsListViewModel: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var articles: [Article] = []

    func fetchNews() {
        WebService.shared.fetchArticles()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("ERROR: \(error.localizedDescription)")
                case .finished:
                    print("SUCCESS: fetchArticles")
                }
            } receiveValue: {
                self.articles = $0.articles
                print($0)
            }
            .store(in: &subscriptions)
    }
}
