//
//  ServiceClient.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Moya
import RxSwift


class ServiceClient {

    static let provider = MoyaProvider<NewsAPI>()

    static func request<T: Codable>(with router: NewsAPI, codable: T.Type) -> Single<T> {
        return provider.rx.request(router)
            .filterSuccessfulStatusCodes()
            .map(T.self)
            .catch { error in
                return Single.error(error)
            }
    }

}
