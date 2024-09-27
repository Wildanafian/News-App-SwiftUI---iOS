//
//  BookmarkViewModel.swift
//  News App
//
//  Created by Wildan Nafian on 9/23/24.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

class BookmarkViewModel: ObservableObject {
    
    private let repository: BookmarkRepository = BookmarkRepositoryImpl()
    private let disposeBag = DisposeBag()
    
    @Published var bookmarksData: [Bookmarks] = []
    
    func getBookmarkedNews(viewContext: NSManagedObjectContext) {
        bookmarksData = repository.getBookmarks(viewContext: viewContext)
    }
    
    func bookmarkNews(news: NewsItem, viewContext: NSManagedObjectContext) {
        repository.bookmarkNews(data: news, viewContext: viewContext)
    }
    
    func deleteBookmark(title: String, viewContext: NSManagedObjectContext) {
        repository.deleteBookmarkedNews(title: title, viewContext: viewContext)
    } 
    
    func deleteBookmark(news: Bookmarks, viewContext: NSManagedObjectContext) {
        repository.deleteBookmarkedNews(news:news, viewContext: viewContext)
        getBookmarkedNews(viewContext: viewContext)
    }
    
}
