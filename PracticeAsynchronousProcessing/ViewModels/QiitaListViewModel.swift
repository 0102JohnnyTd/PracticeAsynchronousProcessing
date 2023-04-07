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
}
