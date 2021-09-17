//
//  NetworkEnums.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

enum HTTPMethods: String, Equatable {
    case get
    case post
    case put
    case delete
    case patch
    case head
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIErrors: Error {
    case nodata
    case serialization
    case decoding
    case encoding
    case server
}

enum Decoders {
    public static let plainDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
