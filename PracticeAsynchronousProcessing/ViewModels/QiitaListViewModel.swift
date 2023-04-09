//
//  QiitaListViewModel.swift
//  PracticeAsynchronousProcessing
//
//  Created by Johnny Toda on 2023/04/07.
//

import Foundation

final class QiitaListViewModel: ObservableObject {
    // 空の配列を定義
    @Published var articlesList: [Article] = [Article(title: "テスト1"),Article(title: "テスト2"),Article(title: "テスト3")]
    // API通信処理を管理するModelのインスタンスを生成
    private let apiClient = APIClient()
    
    // ViewのonAppearで通信処理を実行
    func onAppear() {
        // 🍎Taskとは
        // 🍎Taskでasyncキーワードが付いたメソッドを実行するとメソッドにasyncキーワードを書かなくても良くなる？ = asyncキーワードじゃだめ？Taskにする理由とは？
        Task {
            await fetchArticles()
        }
    }

    // 🍎@MainActorをつけずともコンパイルエラーは出力されてないが、無意味なはずはないのでMainActorの役割は知りたい。
       // 紫アラート： 『Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.』が表示される。
       // つけるとテスト要素が最初から表示されることはなくなる。
    @MainActor
    private func fetchArticles() async {
        do {
            let articles = try await apiClient.fetchArticles()
            articlesList = articles
        } catch {
            print("error:", error)
        }
    }
}
