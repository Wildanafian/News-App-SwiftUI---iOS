//
//  NewsRepository.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Foundation
import RxSwift

protocol NewsRepository {
    func getTopHeadlineNews() -> Single<[NewsItem]>
}

struct NewsRepositoryImpl: NewsRepository {
    
    private let remote: NewsRemote

    init(remote: NewsRemote = NewsRemoteImpl()) {
        self.remote = remote
    }

    func getTopHeadlineNews() -> Single<[NewsItem]> {
        return remote.getNews()
            .map { newsItem in
                return newsItem.toDomainModel()
            }
    }
    
}
