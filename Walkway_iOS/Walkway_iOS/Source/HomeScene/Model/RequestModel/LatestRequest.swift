//
//  LatestRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

struct LatestRequest: Codable {
    var page: Int
    
    init(_ page: Int) {
        self.page = page
    }
}
