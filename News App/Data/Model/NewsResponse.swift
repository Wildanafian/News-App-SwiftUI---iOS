//
//  NewsResponse.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

// MARK: - Source
struct Source: Codable {
    let id, name: String
}
