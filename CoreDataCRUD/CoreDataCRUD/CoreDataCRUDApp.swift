//
//  CoreDataCRUDApp.swift
//  CoreDataCRUD
//
//  Created by Matheus Silva on 30/06/25.
//

import SwiftUI

@main
struct CoreDataCRUDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
