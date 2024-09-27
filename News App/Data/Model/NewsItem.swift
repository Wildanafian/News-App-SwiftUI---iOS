//
//  NewsItem.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Foundation

struct NewsItem : Codable, Hashable {
    var title: String
    var content: String
    var date: String
    var imgUrl: String
    var isBookmark: Bool
}
