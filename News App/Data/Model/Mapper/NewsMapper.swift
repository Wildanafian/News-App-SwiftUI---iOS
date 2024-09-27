//
//  NewsMapper.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Foundation

extension NewsResponse {
    func toDomainModel() -> [NewsItem] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = GeneralConstant.EXPECTED_DATE_FORMAT
        return articles.map { article in
            NewsItem (
                title: article.title,
                content: article.description,
                date: DateFormatterHelper().formatDate(input: article.publishedAt),
                imgUrl: article.urlToImage,
                isBookmark: false
            )
        }
    }
}

extension Bookmarks {
    func toNewsItem() -> NewsItem {
        return NewsItem (
            title: title ?? "",
            content: content ?? "",
            date: date ?? "",
            imgUrl: imgUrl ?? "",
            isBookmark: isBookmarked
        )
    }
}
