//
//  FollowerService.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/20.
//

import Foundation
import Moya

enum CourseService {
    case create(param: CourseCreateRequest)
    case record(ID: String, param: RecordRequest)
    case detail(String)
    case commentDetail(String)
    case running(String)
}

extension CourseService: TargetType {
  public var baseURL: URL {
    return URL(string: GeneralAPI.baseURL)!
  }
  
  var path: String {
    switch self {
    case .create:
        return "/course/create"
    case .record(let courseId, _):
        return "/course/\(courseId)/record"
    case .detail(let courseId):
        return "/course/\(courseId)/detail"
    case .commentDetail(let courseId):
        return "/course/\(courseId)/detail/comment"
    case .running(let courseId):
        return "/course/\(courseId)/running"
    }
  }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .create,
             .record,
             .detail,
             .commentDetail,
             .running:
            return JSONEncoding.default
        }
    }
  
  var method: Moya.Method {
    switch self {
    case .detail,
         .commentDetail,
         .running:
        return .get
    case .create,
         .record:
        return .post
    }
  }
  
  var sampleData: Data {
    return "@@".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case .detail,
         .commentDetail,
         .running:
        return .requestPlain
    case .create(let param):
        return .requestJSONEncodable(param)
    case .record(let ID, let param):
        let encoded = try! JSONEncoder().encode(param)
        return .requestCompositeData(bodyData: encoded, urlParameters: ["courseId": ID])
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
