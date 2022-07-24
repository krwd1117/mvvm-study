//
//  Article.swift
//  1.NewsApp+Combine
//
//  Created by Jeongwan Kim on 2022/07/24.
//

import Foundation

// MARK: - ArticleResponse
struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String?
    let description: String?
    
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

