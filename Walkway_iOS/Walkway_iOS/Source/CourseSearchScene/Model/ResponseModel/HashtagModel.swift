//
//  HashtagModel.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/03/23.
//

import Foundation

// MARK: - HashtagModel
struct HashtagModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: HashtagResponse
}

// MARK: - HashtagResponse
struct HashtagResponse: Codable {
    let courses: [Course]
}
