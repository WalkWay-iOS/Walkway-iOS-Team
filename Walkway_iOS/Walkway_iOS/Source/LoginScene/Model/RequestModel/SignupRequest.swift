//
//  SignupRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

struct SignupRequest: Codable {
    var name: String
    var email: String
    var id: String
    var password: String
    
    init(_ name: String, _ email: String, _ id: String, _ password: String) {
        self.name = name
        self.email = email
        self.id = id
        self.password = password
    }
}
