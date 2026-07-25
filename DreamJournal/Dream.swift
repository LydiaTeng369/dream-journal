import Foundation
import SwiftData

@Model
final class Dream {
    var title: String
    var content: String
    var date: Date

    init(title: String, content: String, date: Date = Date()) {
        self.title = title
        self.content = content
        self.date = date
    }
}
