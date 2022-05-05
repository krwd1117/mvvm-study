//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Jeongwan Kim on 2022/05/05.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    // section의 개수
    var numberOfSections: Int {
        return 1
    }
    
    // sction에 있는 row의 개수
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    // 선택한 article을 반환
    func articleAtIndes(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
}

// view에 정보를 전달할 viewModel
struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    // init에서는 aritcle의 순서대로 aritcle로 전달
    init(_ article: Article) {
        self.article = article
    }
}

// extension을 여러개로 나누는 이유? 이렇게 할 필요는 없으나, 가독성 향상을 위해 나눌뿐 편한대로 작업하면 됨
extension ArticleViewModel {
    var title: String {
        return article.title ?? ""
    }
    
    var description: String {
        return article.description ?? ""
    }
}
