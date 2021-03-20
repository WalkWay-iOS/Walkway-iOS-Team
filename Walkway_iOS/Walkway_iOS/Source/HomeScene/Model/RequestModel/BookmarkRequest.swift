//
//  BookmarkRequest.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/19.
//

import Foundation

struct BookmarkRequest: Codable {
    var isBookmark: String
    
    init(_ isBookmark: String) {
        self.isBookmark = isBookmark
    }
}
