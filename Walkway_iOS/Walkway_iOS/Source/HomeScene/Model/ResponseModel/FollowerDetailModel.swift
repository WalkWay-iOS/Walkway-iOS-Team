//
//  FollowerDetailModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation

// MARK: - FollowerDetailModel
struct FollowerDetailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: FollowResponse
}

// MARK: - FollowResponse
struct FollowResponse: Codable {
    let isFollowing: Bool
    let user: Follower
    let course: [Course]
    let record: [Record]
}

// MARK: - Record
struct Record: Codable {
    let id: String
    let distance, rate: Double
    let strength: Double
    let time: String
    let comment: Comment
    let courseName: String
    let userID, courseID, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case distance, rate, strength, time, comment, courseName
        case userID = "userId"
        case courseID = "courseId"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Comment
struct Comment: Codable {
    let id, userID, courseID, content: String
    let createdAt, updatedAt, userName: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case courseID = "courseId"
        case content, createdAt, updatedAt, userName, rate
    }
}
