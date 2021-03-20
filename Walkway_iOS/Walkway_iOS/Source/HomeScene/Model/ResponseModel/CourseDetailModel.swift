//
//  CourseDetailModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation

// MARK: - CourseDetailModel
struct CourseDetailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DetailCourseResponse
}

// MARK: - DetailCourseResponse
struct DetailCourseResponse: Codable {
    let course: DetailCourse
    let comment: [Comments]
}

// MARK: - Comment
struct Comments: Codable {
    let id, userID, courseID, content: String
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case courseID = "courseId"
        case content, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Course
struct DetailCourse: Codable {
    let rateAverage, strengthAverage: Double
    let isSeoul: Bool
    let image: String?
    let official, usesCount, bookmarkCount: Int
    let position: [[Double]]
    let placeName: [String]
    let id, title: String
    let distance: Double
    let time, content: String
    let hashtag: [Hashtag]
    let user: Follower
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case rateAverage, strengthAverage, isSeoul, image, official, usesCount, bookmarkCount, position, placeName
        case id = "_id"
        case title, distance, time, content, hashtag, user, createdAt, updatedAt
        case v = "__v"
    }
}
