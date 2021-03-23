//
//  UserDetailModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/23.
//

import Foundation

// MARK: - UserDetailModel
struct UserDetailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: UserResponse
}

// MARK: - UserResponse
struct UserResponse: Codable {
    let user: Follower
    let course: [Course]
    let record: [Record]
}
