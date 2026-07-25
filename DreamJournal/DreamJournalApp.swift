import SwiftUI
import SwiftData

@main
struct DreamJournalApp: App {
    var body: some Scene {
        WindowGroup {
            DreamListView()
        }
        .modelContainer(for: Dream.self)
    }
}
