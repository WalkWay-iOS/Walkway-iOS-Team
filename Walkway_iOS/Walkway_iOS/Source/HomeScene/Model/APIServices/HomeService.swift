//
//  HomeService.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/18.
//

import Foundation
import Moya

enum HomeServices {
    case main
    case populars(param: PopularRequest)
    case bookmarks(param: BookmarkRequest)
    case latests(param: LatestRequest)
    case seoulCourses
    case jejuCourses
}

extension HomeServices: TargetType {
  public var baseURL: URL {
    return URL(string: GeneralAPI.baseURL)!
  }
  
  var path: String {
    switch self {
    case .main:
        return "/home"
    case .populars( _):
        return "/home/populars"
    case .bookmarks( _):
        return "/home/bookmarks"
    case .latests( _):
        return "/home/latest"
    case .seoulCourses:
        return "/home/seoulCourses"
    case .jejuCourses:
        return "/home/jejuCourses"
    }
  }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .populars,
             .bookmarks,
             .latests:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
  
  var method: Moya.Method {
    switch self {
    case .main,
         .populars,
         .bookmarks,
         .latests,
         .seoulCourses,
         .jejuCourses:
      return .get
    }
  }
  
  var sampleData: Data {
    return "@@".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case .main:
        return .requestPlain
    case .populars(let param):
        return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
    case .bookmarks(let param):
        return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
    case .latests(let param):
        return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
    case .seoulCourses:
        return .requestPlain
    case .jejuCourses:
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
