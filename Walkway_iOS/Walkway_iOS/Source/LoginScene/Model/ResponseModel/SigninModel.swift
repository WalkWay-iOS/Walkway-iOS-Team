//
//  SigninModel.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

// MARK: - SigninModel
struct SigninModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SigninResponse
}

// MARK: - SigninResponse
struct SigninResponse: Codable {
    let name, email, id, accessToken: String
}
