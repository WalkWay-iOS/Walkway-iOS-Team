//
//  SignupRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

struct SigninRequest: Codable {
    var id: String
    var password: String
    
    init(_ id: String, _ password: String) {
        self.id = id
        self.password = password
    }
}
