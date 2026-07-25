import SwiftUI
import SwiftData

struct AddDreamView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var content = ""
    @State private var date = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section("标题") {
                    TextField("给这个梦起个名字", text: $title)
                }
                Section("日期") {
                    DatePicker("梦的日期", selection: $date, displayedComponents: .date)
                }
                Section("内容") {
                    TextEditor(text: $content)
                        .frame(minHeight: 150)
                }
            }
            .navigationTitle("记录梦境")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        let dream = Dream(title: title, content: content, date: date)
                        context.insert(dream)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}
