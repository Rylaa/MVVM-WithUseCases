//
//  NetworkService.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//
import Foundation

final class NetworkService {
    
    static let service: NetworkService = NetworkService()
    private var session = URLSession.shared
    private let successCodeRange = 200..<300
    
    private init() {}
    
    func send<T: Codable>(_ urlRequest: URLRequest, callback: @escaping (Result<T>, Data?) -> Void) {
        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let self = self else { callback(.failure(APIErrors.nodata), nil); return }
            self.handleServerResponse(data, response, error) { result,data  in
                DispatchQueue.main.async {
                    callback(result,data)
                }
            }
        }.resume()
    }
    
    private func handleServerResponse<T: Codable>(_ data: Data?, _ response: URLResponse?, _ error: Error?, callback: @escaping (Result<T>, Data?) -> Void) {
        if let error = error {
            callback(.failure(error), nil)
        } else if let data = data {
            let code: Int = (response as? HTTPURLResponse)?.statusCode ?? 0
            if successCodeRange.contains(code) {
                ResponseCreator.decodeResponse(data, callback)
            } else {
                callback(.failure(APIErrors.server), data)
            }
        } else {
            callback(.failure(APIErrors.nodata), data)
        }
    }
}
