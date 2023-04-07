//
//  Article.swift
//  PracticeAsynchronousProcessing
//
//  Created by Johnny Toda on 2023/04/07.
//

import Foundation

struct Article: Decodable, Identifiable {
    let title: String
    var id: String { title }
}
