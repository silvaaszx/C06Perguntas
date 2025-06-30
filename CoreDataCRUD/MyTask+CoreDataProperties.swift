//
//  MyTask+CoreDataProperties.swift
//  CoreDataCRUD
//
//  Created by Matheus Silva on 30/06/25.
//
//

import Foundation
import CoreData


extension MyTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyTask> {
        return NSFetchRequest<MyTask>(entityName: "MyTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var timestamp: Date?

}

extension MyTask : Identifiable {

}
