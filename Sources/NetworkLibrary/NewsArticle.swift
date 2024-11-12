
//  NewsArticle.swift
//  NetworkLibrary
//
//  Created by shota shotadze on 11.11.24.
//


import Foundation

public struct NewsArticle: Decodable {
    public let title: String
    public let author: String?
    public let publishedAt: String
    public let urlToImage: String?
    public let description: String?

    public init(title: String = "", author: String? = nil, publishedAt: String = "", urlToImage: String? = nil, description: String? = nil) {
        self.title = title
        self.author = author
        self.publishedAt = publishedAt
        self.urlToImage = urlToImage
        self.description = description
    }
}

public struct NewsResponse: Decodable {
    public let articles: [NewsArticle]

    public init(articles: [NewsArticle] = []) {
        self.articles = articles
    }
}
