//
//  FollowerService.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation
import Moya

enum FollowerServices {
    case followerDetail(String)
    case follow(String)
    case unfollow(String)
}

extension FollowerServices: TargetType {
  public var baseURL: URL {
    return URL(string: GeneralAPI.baseURL)!
  }
  
  var path: String {
    switch self {
    case .followerDetail(let followerID):
        return "/follower/\(followerID)"
    case .follow(let followerID):
        return "/follower/\(followerID)/follow"
    case .unfollow(let followerID):
        return "/follower/\(followerID)/unfollow"
    }
  }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .followerDetail,
             .follow,
             .unfollow:
            return JSONEncoding.default
        }
    }
  
  var method: Moya.Method {
    switch self {
    case .followerDetail,
         .follow,
         .unfollow:
      return .get
    }
  }
  
  var sampleData: Data {
    return "@@".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case .followerDetail,
         .follow,
         .unfollow:
        return .requestPlain
    }
  }

  var headers: [String: String]? {
    switch self {
    default:
        let accessToken = UserDefaultStorage.accessToken
      return ["Content-Type": "application/json",
              "jwt" : accessToken]
    }
  }
}
