//
//  NewsRemote.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Foundation
import RxSwift

protocol NewsRemote {
    func getNews() -> Single<NewsResponse>
}

struct NewsRemoteImpl: NewsRemote {
    func getNews() -> Single<NewsResponse> {
        return ServiceClient.request(with: .getTopHeadlineNews(source: APIConstant.SOURCE), codable: NewsResponse.self)
    }
}
