//
//  BookmarkView.swift
//  News App
//
//  Created by Wildan Nafian on 9/22/24.
//

import SwiftUI
import CoreData

struct BookmarkView: View {
    
    @StateObject var viewModel = BookmarkViewModel()
    
    @EnvironmentObject var manager: CoreDataController
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var selectedNews: NewsItem? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.bookmarksData, id: \.self) { item in
                            let temp = item.toNewsItem()
                            NavigationLink(destination: DetailView(newsData: temp)) {
                                BookmarkItemCard(
                                    item: temp,
                                    onTapDelete: {
                                        viewModel.deleteBookmark(news: item, viewContext: viewContext)
                                    }
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationTitle("Bookmark")
                }
                if viewModel.bookmarksData.isEmpty {
                    EmptyStateView()
                    .frame(
                        maxHeight: .infinity,
                        alignment: .center
                    )
                }
            }
            .onAppear {
                viewModel.getBookmarkedNews(viewContext: viewContext)
            }
        }
    }
    
}

#Preview {
    BookmarkView()
        .environment(\.managedObjectContext, CoreDataController.preview.container.viewContext)
}
