//
//  NetworkRequestCreator.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

struct RequestCreator {
    
    static func request(for webservice: EndPointable) -> URLRequest {
        
        var components = URLComponents(string: webservice.base.appending(webservice.path))!
        components.queryItems = []
        
        webservice.urlParameters?.forEach({
            let query = URLQueryItem(name: $0.key, value: "\($0.value)")
            components.queryItems?.append(query)
        })
        let url: URL = components.url!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: webservice.timeout)
        
        webservice.headers?.forEach({ request.addValue($0.value, forHTTPHeaderField: $0.key) })
        if webservice.httpMethod != .get, let params = webservice.bodyParameters, !params.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [.prettyPrinted])
        }
        
        request.httpMethod = webservice.httpMethod.rawValue
        
        return request
    }
}
