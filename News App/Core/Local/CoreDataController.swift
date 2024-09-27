//
//  DataController.swift
//  News App
//
//  Created by Wildan Nafian on 9/22/24.
//

import CoreData

class CoreDataController: NSObject, ObservableObject {
    let container = NSPersistentContainer(name: "LocalData")

    @Published var bookmarks: [Bookmarks] = [Bookmarks]()

    override init() {
        super.init()
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    static var preview: CoreDataController = {
        let result = CoreDataController()
        let viewContext = result.container.viewContext

        let bookmark = Bookmarks(context: viewContext)
        bookmark.title = "Sample Bookmark"
        bookmark.content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        bookmark.date = "20 Sept 2024"
        bookmark.imgUrl = "https://techcrunch.com/wp-content/uploads/2024/05/GettyImages-1350655821.jpeg?resize=1200,796"
        bookmark.isBookmarked = false

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        return result
    }()
}
