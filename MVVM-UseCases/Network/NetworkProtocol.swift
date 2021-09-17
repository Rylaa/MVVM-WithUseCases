//
//  NetworkProtocol.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

protocol EndPointable {
    var base: String { get }
    var path: String { get }
    var timeout: TimeInterval { get }
    var httpMethod: HTTPMethods { get }
    var headers: [String: String]? { get }
    var urlParameters: [String: Any]? { get }
    var bodyParameters: Data? { get }
}
