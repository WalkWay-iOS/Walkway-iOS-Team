//
//  CourseCreateRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation

struct CourseCreateRequest: Codable {
    var title: String
    var distance: Double
    var time: String
    var content: String
    var position: [[Double]]
    var placeName: [String]
    var hashtag: [String]
    
    init(_ title: String,_ distance: Double,_ time: String,_ content: String,_ position: [[Double]],
         _ placeName: [String],_ hashtag: [String]) {
        self.title = title
        self.distance = distance
        self.time = time
        self.content = content
        self.position = position
        self.placeName = placeName
        self.hashtag = hashtag
    }
}
