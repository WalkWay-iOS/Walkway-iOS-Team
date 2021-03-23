//
//  SearchService.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/03/22.
//

import Foundation
import Moya

enum SearchServices {
    case keywordSearch(String)
    case hashtagSearch(param: HashtagRequest)
}

extension SearchServices: TargetType {
  public var baseURL: URL {
    return URL(string: GeneralAPI.baseURL)!
  }
  
  var path: String {
    switch self {
    case .keywordSearch(let keywordID):
        return "/search/\(keywordID)"
    case .hashtagSearch( _):
        return "/search"
    }
  }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .hashtagSearch:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
  
  var method: Moya.Method {
    switch self {
    case .keywordSearch,
         .hashtagSearch:
      return .get
    }
  }
  
  var sampleData: Data {
    return "@@".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case .keywordSearch:
        return .requestPlain
    case .hashtagSearch(let param):
        return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
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
