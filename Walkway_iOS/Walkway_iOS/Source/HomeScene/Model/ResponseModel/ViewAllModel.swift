//
//  ViewAllModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

// MARK: - ViewAllModel
struct ViewAllModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: CourseResponse
}

// MARK: - CourseResponse
struct CourseResponse: Codable {
    let course: [Course]
}
