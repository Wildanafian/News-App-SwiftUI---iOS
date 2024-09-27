//
//  News_AppApp.swift
//  News App
//
//  Created by Wildan Nafian on 9/21/24.
//

import SwiftUI

@main
struct News_App: App {

    @StateObject private var dataController = CoreDataController()
    @State private var isActive = false

    var body: some Scene {
        WindowGroup {
            if isActive {
                NewsListView()
                    .environmentObject(dataController)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }else {
                SplashView(isActive: $isActive)
            }
        }
    }
}
