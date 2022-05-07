//
//  Article.swift
//  NewsApp
//
//  Created by Jeongwan Kim on 2022/05/05.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
