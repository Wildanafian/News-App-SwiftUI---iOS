//
//  ItemListView.swift
//  News App
//
//  Created by Wildan Nafian on 9/22/24.
//

import SwiftUI
import CoreData

struct NewsItemCard: View {
    var item: NewsItem
    var onTapBookmark: ()-> Void
    @Binding var selectedNews: NewsItem?
    @Binding var isSheetDisplayed: Bool

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.imgUrl)){ image in
                image.resizable()
                    .onTapGesture {
                        selectedNews = item
                        isSheetDisplayed = true
                    }
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(width: 100, height: nil)
            .clipped()

            VStack (alignment: .leading){
                Text(item.title)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .font(.headline)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .padding(.top, 6)
                Text(item.content)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .font(.caption)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .foregroundColor(Color.gray)
                    .padding(.top, 1)


            }.frame(
                width: nil,
                height: 150,
                alignment: .topLeading
            )
            .padding(.leading, 12)
            .padding(.trailing, 12)

            let icon = if(item.isBookmark) {"bookmark.fill"} else {"bookmark"}
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24, height: 24, alignment: .topTrailing)
                .padding(.trailing, 6)
                .onTapGesture {
                    onTapBookmark()
                }

        }.frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        .padding(.top, 6)
        .padding(.bottom, 6)
    }

}

struct BookmarkItemCard: View {
    var item: NewsItem
    var onTapDelete:()->Void

    @EnvironmentObject var manager: CoreDataController
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.imgUrl)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(width: 100, height: nil)
            .clipped()

            VStack (alignment: .leading){
                Text(item.title)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .font(.headline)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .padding(.top, 6)
                Text(item.content)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .font(.caption)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .foregroundColor(Color.gray)
                    .padding(.top, 1)
            }.frame(
                width: nil,
                height: 150,
                alignment: .topLeading
            )
            .padding(.leading, 12)
            .padding(.trailing, 12)

            Image(systemName: "trash")
                .foregroundColor(.red)
                .frame(width: 24, height: 24, alignment: .topTrailing)
                .padding(.trailing, 6)
                .onTapGesture {
                    onTapDelete()
                }
        }.frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        .padding(.top, 6)
        .padding(.bottom, 6)
    }
}


struct RelatedNewsHorizontal: View {

    var data: [NewsItem]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(data, id:\.self) { item in
                    VStack {
                        AsyncImage(url: URL(string: item.imgUrl)){ image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.scaledToFill()
                            .frame(
                                height: 100
                            )
                            .clipped()

                        Text(item.title)
                            .font(.caption2)
                            .padding(4)


                    }
                    .frame(
                        width: 130,
                        height: 180,
                        alignment: .top
                    )
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .padding(.leading, 12)
                    .padding(.top, 6)
                    .padding(.bottom, 6)
                }
            }
        }
    }
}

#Preview {
//    NewsListView()
    NewsDetailSheet(newsData: NewsItem(title: "News 1", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", date: "20 Sept 2024", imgUrl: "https://wp.inews.co.uk/wp-content/uploads/2021/10/PRI_205675309-760x557.jpg", isBookmark: true) )
}
