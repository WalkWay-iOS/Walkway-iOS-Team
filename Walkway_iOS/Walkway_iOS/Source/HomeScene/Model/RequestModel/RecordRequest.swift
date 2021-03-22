//
//  RecordRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation

struct RecordRequest: Codable {
    var distance: Double
    var time: String
    var comment: String
    var rate: Double
    var strength: Double
    
    init(_ distance: Double,_ time: String,_ comment: String,_ rate: Double,_ strength: Double) {
        self.distance = distance
        self.time = time
        self.comment = comment
        self.rate = rate
        self.strength = strength
    }
}
