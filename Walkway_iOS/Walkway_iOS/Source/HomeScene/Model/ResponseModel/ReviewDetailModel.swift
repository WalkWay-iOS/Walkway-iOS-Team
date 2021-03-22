//
//  ReviewDetailModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/22.
//

import Foundation

// MARK: - ReviewDetailModel
struct ReviewDetailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: CommentResponse
}

// MARK: - CommentResponse
struct CommentResponse: Codable {
    let comment: [Comments]
}
