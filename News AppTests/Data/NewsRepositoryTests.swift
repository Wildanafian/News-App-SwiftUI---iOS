//
//  NewsRepositoryTests.swift
//  News AppTests
//
//  Created by Wildan Nafian on 9/24/24.
//

import XCTest
@testable import News_App
import RxSwift
import RxBlocking

final class NewsRepositoryTests: XCTestCase {

    private var sut: NewsRepositoryImpl!

    override func setUpWithError() throws {
        sut = NewsRepositoryImpl(remote: MockedNewsRemote())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetNews_returnValidData() throws {
        let expected = [
            NewsItem (
                title: "Sample Bookmark",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                date: "24 September 2024 | 07:26:10",
                imgUrl: "https://techcrunch.com/wp-content/uploads/2024/05/GettyImages-1350655821.jpeg?resize=1200,796",
                isBookmark: false
            )
        ]

        let result = try sut.getTopHeadlineNews().toBlocking().first()

        XCTAssertEqual(expected, result)
    }

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

struct MockedNewsRemote: NewsRemote {
    var mockedNews: Single<NewsResponse> = .just(
        NewsResponse(
            status: "ok", totalResults: 1, articles: [
                Article(
                    source: Source(
                        id: "",
                        name: ""
                    ),
                    author: "John",
                    title: "Sample Bookmark",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    url: "https://techcrunch.com/wp-content/uploads/2024/05/GettyImages-1350655821.jpeg?resize=1200,796",
                    urlToImage: "https://techcrunch.com/wp-content/uploads/2024/05/GettyImages-1350655821.jpeg?resize=1200,796",
                    publishedAt: "2024-09-24T00:26:10Z",
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
            ]
        )
    )

    func getNews() -> Single<NewsResponse> {
        return mockedNews
    }
}
