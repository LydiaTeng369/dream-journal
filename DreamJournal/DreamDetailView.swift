import SwiftUI

struct DreamDetailView: View {
    let dream: Dream

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(dream.date, format: .dateTime.year().month().day().weekday(.wide))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(dream.content.isEmpty ? "（没有记录内容）" : dream.content)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(dream.title)
        .navigationBarTitleDisplayMode(.large)
    }
}
