//
//  BookmarkRepository.swift
//  News App
//
//  Created by Wildan Nafian on 9/23/24.
//

import Foundation
import CoreData

protocol BookmarkRepository {
    func getBookmarks(viewContext: NSManagedObjectContext) -> [Bookmarks]
    func getBookmarksNews(viewContext: NSManagedObjectContext) -> [NewsItem]
    func bookmarkNews(data: NewsItem, viewContext: NSManagedObjectContext)
    func deleteBookmarkedNews(title: String, viewContext: NSManagedObjectContext)
    func deleteBookmarkedNews(news: Bookmarks, viewContext: NSManagedObjectContext)
}

struct BookmarkRepositoryImpl: BookmarkRepository {
    
    func getBookmarks(viewContext: NSManagedObjectContext) -> [Bookmarks] {
        let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func getBookmarksNews(viewContext: NSManagedObjectContext) -> [NewsItem] {
        let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        
        do {
            let bookmarks = try viewContext.fetch(fetchRequest)
            return bookmarks.map { data in
                data.toNewsItem()
            }
        } catch {
            return []
        }
    }
    
    func bookmarkNews(data: NewsItem, viewContext: NSManagedObjectContext) {
        let news = Bookmarks(context: viewContext)
        news.title = data.title
        news.content = data.content
        news.date = data.date
        news.imgUrl = data.imgUrl
        news.isBookmarked = data.isBookmark
        
        do {
            try viewContext.save()
        } catch {
        }
    }
    
    func deleteBookmarkedNews(title: String, viewContext: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            let bookmarks = try viewContext.fetch(fetchRequest)
            if let bookmarkToDelete = bookmarks.first {
                viewContext.delete(bookmarkToDelete)
                try viewContext.save()
            }
        } catch {
        }
    }
    
    func deleteBookmarkedNews(news: Bookmarks, viewContext: NSManagedObjectContext) {
        do {
            viewContext.delete(news)
            try viewContext.save()
        } catch {
            let nsError = error as NSError
        }
    }
    
}
