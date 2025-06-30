//
//  Item.swift
//  SwiftDataCRUD
//
//  Created by Matheus Silva on 30/06/25.
//
import SwiftData
import Foundation

@Model
class Task {
    var id: UUID = UUID()
    var title: String
    var timestamp: Date

    init(title: String, timestamp: Date = Date()) {
        self.title = title
        self.timestamp = timestamp
    }
}

