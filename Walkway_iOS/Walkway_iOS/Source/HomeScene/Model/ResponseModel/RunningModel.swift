//
//  RunningModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/22.
//

import Foundation

// MARK: - RunningModel
struct RunningModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: RunningResponse
}

// MARK: - RunningResponse
struct RunningResponse: Codable {
    let content: String
    let position: [[Double]]
    let landmark: [String]
}
