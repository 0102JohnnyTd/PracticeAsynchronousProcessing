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
    func fetchArticleData(completion: @escaping (Result<[Article], Error>) -> Void) {
        // リクエストURLを定義
        guard let url = URL(string: requestURLString) else { fatalError("UnexpectedError") }
        // DataTaskを定義
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            if let error = error {
                // 通信エラー時実行
                completion(.failure(error))
            }
            guard let data = data else { fatalError("UnexpectedError") }
            do {
                let articlesList = try JSONDecoder().decode([Article].self, from: data)
                // 通信、パース成功時に実行
                completion(.success(articlesList))
            } catch {
                // パースエラー時に実行
                completion(.failure(error))
            }
        })
        // 通信を実行
        dataTask.resume()
    }
}
