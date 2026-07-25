import SwiftUI
import SwiftData

struct DreamListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Dream.date, order: .reverse) private var dreams: [Dream]

    @State private var showingAddSheet = false
    @State private var searchText = ""

    // 搜索过滤：标题或正文包含关键词
    private var filteredDreams: [Dream] {
        if searchText.isEmpty {
            return dreams
        }
        return dreams.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.content.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if dreams.isEmpty {
                    ContentUnavailableView(
                        "还没有梦境",
                        systemImage: "moon.stars",
                        description: Text("点击右上角 + 记录你的第一个梦")
                    )
                } else {
                    List {
                        ForEach(filteredDreams) { dream in
                            NavigationLink {
                                DreamDetailView(dream: dream)
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(dream.title)
                                        .font(.headline)
                                    Text(dream.date, format: .dateTime.year().month().day())
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .onDelete(perform: deleteDreams)
                    }
                    .searchable(text: $searchText, prompt: "搜索梦境")
                }
            }
            .navigationTitle("梦境日记")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddDreamView()
            }
        }
    }

    private func deleteDreams(at offsets: IndexSet) {
        for index in offsets {
            context.delete(filteredDreams[index])
        }
    }
}
