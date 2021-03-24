//
//  KeywordModel.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/03/23.
//

import Foundation

// MARK: - KeywordModel
struct KeywordModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: KeywordResponse
}

// MARK: - KeywordResponse
struct KeywordResponse: Codable {
    let hashtag: [Hashtag]
}
