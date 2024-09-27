//
//  ApiProvider.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//


import Moya

enum NewsAPI {
    case getTopHeadlineNews(source: String)
}

extension NewsAPI: TargetType {

    var baseURL: URL {
        return URL(string: APIConstant.BASE_URL)!
    }

    var path: String {
        switch self {
        case .getTopHeadlineNews:
            return APIConstant.HEADLINE_PATH
        }
    }

    var method: Method {
        switch self {
        case.getTopHeadlineNews:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getTopHeadlineNews(let source):
            let parameters: [String: Any] = [
                "sources": source,
                "apiKey": APIConstant.KEY,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
