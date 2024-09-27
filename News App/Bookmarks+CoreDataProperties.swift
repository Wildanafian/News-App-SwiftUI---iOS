//
//  Bookmarks+CoreDataProperties.swift
//  
//
//  Created by Wildan Nafian on 9/22/24.
//
//

import Foundation
import CoreData


extension Bookmarks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmarks> {
        return NSFetchRequest<Bookmarks>(entityName: "Bookmarks")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: String?
    @NSManaged public var imgUrl: String?
    @NSManaged public var isBookmarked: Bool
    @NSManaged public var title: String?

}

extension Bookmarks : Identifiable {

}
