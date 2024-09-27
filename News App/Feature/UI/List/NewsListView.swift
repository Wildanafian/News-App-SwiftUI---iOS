//
//  NewsListView.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import SwiftUI
import CoreData

struct NewsListView: View {

    @StateObject var viewModel = NewsViewModel()
    @StateObject var bookmarkViewModel = BookmarkViewModel()

    @Environment(\.managedObjectContext) var viewContext

    @State private var selectedNews: NewsItem? = nil
    @State private var hasFetched = false
    @State private var isSheetDisplayed = false

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.data.indices, id: \.self) { index in
                            NavigationLink(destination: DetailView(newsData: viewModel.data[index])) {
                                NewsItemCard(
                                    item: viewModel.data[index],
                                    onTapBookmark: {
                                        updateBookmarkStatus(index: index)
                                    },
                                    selectedNews: $selectedNews,
                                    isSheetDisplayed: $isSheetDisplayed
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }.refreshable {
                    viewModel.getLatestNews(viewContext: viewContext)
                }
                .sheet(isPresented: Binding(
                    get: { isSheetDisplayed },
                    set: { isSheetDisplayed = $0 }
                )) {
                    if let selectedNews = selectedNews {
                        NewsDetailSheet(newsData: selectedNews)
                            .presentationDetents([.medium, .large])
                    }
                }
                .alert(isPresented: $viewModel.isAlertDisplayed, content: {
                    Alert(
                        title: Text(LocalizedStringKey("ErrorTitle")),
                        message: Text(viewModel.errorMessage ?? ""),
                        dismissButton: .default(Text(LocalizedStringKey("GotIt")))
                    )
                })
                .alert(isPresented: $viewModel.isFirstLaunch, content: {
                    Alert(
                        title: Text(LocalizedStringKey("WelcomeTitle")),
                        message: Text(LocalizedStringKey("WelcomeContent")),
                        dismissButton: .default(Text(LocalizedStringKey("GotIt"))) {
                            viewModel.setIsNotFirstLaunch()
                        }
                    )
                })
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
            .navigationTitle(LocalizedStringKey("BbcNews"))
            .toolbar {
                NavigationLink(destination: BookmarkView()) {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.blue)
                        .frame(width: 24, height: 24, alignment: .trailing)
                }
            }
            .onAppear{
                //                if !hasFetched {
                viewModel.checkIsFirstLaunch()
                viewModel.getLatestNews(viewContext: viewContext)
                //                    hasFetched = true
                //                }
            }
        }
    }

    private func updateBookmarkStatus(index: Int) {
        let updatedNews = viewModel.toggleBookmark(index: index)
        if(updatedNews.isBookmark) {
            bookmarkViewModel.bookmarkNews(news: updatedNews, viewContext: viewContext)
        } else {
            bookmarkViewModel.deleteBookmark(title: updatedNews.title, viewContext: viewContext)
        }
    }
}

#Preview {
    NewsListView()
}
