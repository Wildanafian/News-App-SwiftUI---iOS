//
//  EmptyStateView.swift
//  News App
//
//  Created by Wildan Nafian on 9/25/24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "folder.badge.questionmark")
                .resizable()
                .foregroundColor(.gray)
                .frame(
                    width: 95,
                    height: 70
                )
                .scaledToFill()
            Text(LocalizedStringKey("DataNotFound"))
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.top, 12)
                .foregroundColor(.gray)
        }
        .frame(
            maxWidth: .infinity
        )
    }
}

#Preview {
    EmptyStateView()
}
