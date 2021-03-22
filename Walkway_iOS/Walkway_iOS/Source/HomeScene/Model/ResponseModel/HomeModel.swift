//
//  HomeModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: HomeResponse
}

// MARK: - HomeResponse
struct HomeResponse: Codable {
    let follower: [Follower]
    let popularCourse, bookmarkCourse, latestCourse: [Course]
}

// MARK: - Course
struct Course: Codable {
    let rateAverage: Double
    let strengthAverage: Double
    let isSeoul: Bool
    let image: String?
    let official, usesCount, bookmarkCount: Int
    let position: [[Double]]
    let placeName: [String]
    let id, title: String
    let distance: Double
    let time: String
    let content: String?
    let hashtag: [Hashtag]
    let user: String
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case rateAverage, strengthAverage, isSeoul, image, official, usesCount, bookmarkCount, position, placeName
        case id = "_id"
        case title, distance, time, content, hashtag, user, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Hashtag
struct Hashtag: Codable {
    let referCount: Int
    let id: String
    let keyword: String

    enum CodingKeys: String, CodingKey {
        case referCount
        case id = "_id"
        case keyword
    }
}

// MARK: - Follower
struct Follower: Codable {
    let followerNumber, followingNumber, courseNumber: Int
    let id, name, email, followerID: String
    let password, createdAt, updatedAt: String
    let v: Int
    let token: String?
    let tokenExp: Int?

    enum CodingKeys: String, CodingKey {
        case followerNumber, followingNumber, courseNumber
        case id = "_id"
        case name, email
        case followerID = "id"
        case password, createdAt, updatedAt
        case v = "__v"
        case token, tokenExp
    }
}
