//
//  MypageService.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/23.
//

import Foundation
import Moya

enum MypageService {
    case mypage
}

extension MypageService: TargetType {
  public var baseURL: URL {
    return URL(string: GeneralAPI.baseURL)!
  }
  
  var path: String {
    switch self {
    case .mypage:
        return "/mypage"
    }
  }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .mypage:
            return JSONEncoding.default
        }
    }
  
  var method: Moya.Method {
    switch self {
    case .mypage:
      return .get
    }
  }
  
  var sampleData: Data {
    return "@@".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case .mypage:
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
