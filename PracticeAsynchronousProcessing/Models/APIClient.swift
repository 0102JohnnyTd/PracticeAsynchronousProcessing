//
//  APIClient.swift
//  PracticeAsynchronousProcessing
//
//  Created by Johnny Toda on 2023/04/07.
//

import Foundation

final class APIClient {
    // リクエストURLの文字列データ
    private let requestURLString = "https://qiita.com/api/v2/items"
    // 通信処理
    func fetchArticles() async throws -> [Article] {
        guard let url = URL(string: requestURLString) else { fatalError("UnexpectedError") }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([Article].self, from: data)
        } catch {
            // 🍎通信エラーとパース(Decode)エラーの書き分け方が分からない。
            throw error
        }
    }
}
