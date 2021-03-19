//
//  SignupModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/18.
//

import Foundation

// MARK: - SignupModel
struct SignupModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignupResponse
}

// MARK: - SignupResponse
struct SignupResponse: Codable {
    let name, email, id: String
}
