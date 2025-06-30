import SwiftUI
import SwiftData

@main
struct SwiftDataCRUDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Task.self])
    }
}
