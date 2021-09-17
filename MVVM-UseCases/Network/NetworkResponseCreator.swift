//
//  NetworkResponseCreator.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

struct ResponseCreator {
    
    static func decodeResponse<T>(_ data: Data, _ callback: (Result<T>, Data?) -> Void) where T: Decodable {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            callback(.success(result), data)
        } catch {
            callback(.failure(APIErrors.decoding), data)
        }
    }
}
