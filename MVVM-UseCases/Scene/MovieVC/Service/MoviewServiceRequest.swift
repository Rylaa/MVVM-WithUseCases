//
//  MoviewServiceRequest.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 19.09.2021.
//

import Foundation

enum MovieRequestable: EndPointable {
    
    case topMovies
    var base: String { NetworkConstants.baseURL }
    var path: String { NetworkConstants.topMoview }
    var timeout: TimeInterval { 15 }
    var httpMethod: HTTPMethods { .get }
    var headers: [String : String]? {
        ["Content-Type": "application/json",
         "Accept": "application/json"]
    }
    var urlParameters: [String : Any]? {
        return nil
    }
    var bodyParameters: Data? {
        return nil
    }
}
