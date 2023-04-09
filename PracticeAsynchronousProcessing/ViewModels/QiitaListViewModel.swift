//
//  QiitaListViewModel.swift
//  PracticeAsynchronousProcessing
//
//  Created by Johnny Toda on 2023/04/07.
//

import Foundation

final class QiitaListViewModel: ObservableObject {
    // 挙動確認の為のダミーデータを要素とした配列を定義
       // ⚠️ 紫エラーの解消方法がわからん: Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
    @Published var articlesList: [Article] = [Article(title: "テスト1"),Article(title: "テスト2"),Article(title: "テスト3")]
    // API通信処理を管理するModelのインスタンスを生成
    private let apiClient = APIClient()
    
    // ViewのonAppearで通信処理を実行
    func onAppear() {
        fetchArticles()
    }

    // apiClientModelの通信処理を実行
    private func fetchArticles() {
        // 循環参照対策の為,selfを弱参照に設定
        apiClient.fetchArticleData(completion: { [weak self]  result in
            switch result {
            case .success(let articlesList):
                self?.articlesList.append(contentsOf: articlesList)
                // Listはreload処理とか要らないのか。
            case .failure(let error):
                print("エラーの詳細:", error)
            }
        })
    }
}
