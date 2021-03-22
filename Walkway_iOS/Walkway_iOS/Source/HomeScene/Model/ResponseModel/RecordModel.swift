//
//  RecordModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation

// MARK: - RecordModel
struct RecordModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: RecordResponse
}

// MARK: - RecordResponse
struct RecordResponse: Codable {
    let record: Record
    let course: Course
}
