//
//  DetailNewsSheet.swift
//  News App
//
//  Created by Wildan Nafian on 9/22/24.
//

import SwiftUI

struct NewsDetailSheet: View {
    let newsData: NewsItem
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: newsData.imgUrl)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center
                        )
                }
                .frame(
                    width: nil,
                    height: 250
                )
                .scaledToFill()
                .clipped()
                
                Text(newsData.title)
                    .font(.title)
                    .lineLimit(4)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                
                Text(newsData.date)
                    .font(.caption)
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                    .foregroundColor(.gray)
                
                Text(newsData.content)
                    .font(.body)
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                    .padding(.top, 6)
            }
            .frame(
                width: nil,
                alignment: .top
            )
        }
    }
}

#Preview {
    NewsDetailSheet(newsData: NewsItem(title: "News 1", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", date: "20 Sept 2024", imgUrl: "https://techcrunch.com/wp-content/uploads/2024/05/GettyImages-1350655821.jpeg?resize=1200,796", isBookmark: false))
}
