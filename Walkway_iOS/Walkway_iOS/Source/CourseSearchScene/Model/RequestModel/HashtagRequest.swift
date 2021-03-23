//
//  HashtagRequest.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/03/22.
//

import Foundation

struct HashtagRequest: Codable {
    var word: String
    var mode: Int
    
    init(_ word: String, _ mode: Int) {
        self.word = word
        self.mode = mode
    }
}
