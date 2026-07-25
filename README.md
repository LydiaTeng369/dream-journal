# DreamJournal 梦境日记

一个极简的 iOS 记梦应用，使用 SwiftUI + SwiftData，纯本地存储。

## 功能
- 记录梦境（标题、日期、内容）
- 列表查看（按日期倒序）
- 查看详情
- 搜索（标题 + 内容）
- 滑动删除

## 技术栈
- SwiftUI
- SwiftData（本地持久化，无需后端）
- 最低要求：Xcode 15+ / iOS 17+

## 文件说明
- `Dream.swift` — SwiftData 数据模型
- `DreamJournalApp.swift` — App 入口，配置 modelContainer
- `DreamListView.swift` — 主列表界面（搜索 + 删除）
- `AddDreamView.swift` — 添加梦境表单
- `DreamDetailView.swift` — 梦境详情

## 在 Xcode 中使用
1. File → New → Project → iOS App
2. 命名 `DreamJournal`，Interface 选 SwiftUI，Storage 选 SwiftData
3. 用本仓库的 Swift 文件替换/添加到项目中
4. ⌘R 运行
