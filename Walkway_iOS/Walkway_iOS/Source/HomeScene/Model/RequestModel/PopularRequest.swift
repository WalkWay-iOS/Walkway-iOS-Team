//
//  PopularRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

struct PopularRequest: Codable {
    var isSeoul: String
    
    init(_ isSeoul: String) {
        self.isSeoul = isSeoul
    }
}
