//
//  NewsViewModel.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import Foundation
import CoreData
import RxSwift
import RxCocoa

class NewsViewModel: ObservableObject {

    private let repository = NewsRepositoryImpl()
    private let repositoryBookmark = BookmarkRepositoryImpl()
    private let repositorySession = SessionRepositoryImpl()

    private let disposeBag = DisposeBag()

    @Published var isLoading: Bool = false
    @Published var isAlertDisplayed: Bool = false
    @Published var data: [NewsItem] = [NewsItem]()
    @Published var errorMessage: String? = nil

    @Published var isFirstLaunch: Bool = false

    func getLatestNews(viewContext: NSManagedObjectContext) {
        isLoading = true
        let bookmarkNews = repositoryBookmark.getBookmarksNews(viewContext: viewContext)
        repository.getTopHeadlineNews()
            .subscribe(
                onSuccess: { [weak self] items in
                    print("Fetched items: \(items)")
                    self?.isLoading = false
                    let finalNews = self?.checkIfContainsBookmark(news: items, bookmarkNews: bookmarkNews)
                    self?.data = finalNews ?? []
                    //                    self?.data.append(contentsOf: finalNews ?? [])
                },
                onFailure: { [weak self] error in
                    print("Error fetching news: \(error.localizedDescription)")
                    self?.isLoading = false
                    self?.isAlertDisplayed = true
                    self?.errorMessage = error.localizedDescription
                }
            )
            .disposed(by: self.disposeBag)
    }

    func toggleBookmark(index: Int) -> NewsItem {
        data[index].isBookmark.toggle()

        return data[index]
    }

    private func checkIfContainsBookmark(news: [NewsItem], bookmarkNews: [NewsItem]) -> [NewsItem] {
        var updatedNews = news
        let bookmarkedTitles = Set(bookmarkNews.map { $0.title })

        for (index, newsItem) in news.enumerated() {
            let state = if bookmarkedTitles.contains(newsItem.title) {
                true
            } else {
                false
            }
            updatedNews[index].isBookmark = state
        }

        return updatedNews
    }

    func checkIsFirstLaunch() {
        let value = repositorySession.isFirstLaunch()
        isFirstLaunch = if !value == true {
            !value
        } else {
            false
        }
    }

    func setIsNotFirstLaunch() {
        repositorySession.setIsNotFirstLaunch()
    }

}
