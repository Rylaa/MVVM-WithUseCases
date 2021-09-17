//
//  ItunesService.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation
protocol FetchItunesItemsProtocol: AnyObject {
    func fetchItunesItems(request: EndPointable,  callback: @escaping (Result<ItunesResponseModel>, Data?) -> Void)
}

final class ItunesService: FetchItunesItemsProtocol {
    
    func fetchItunesItems(request: EndPointable,  callback: @escaping (Result<ItunesResponseModel>, Data?) -> Void) {
        fetch(request: request, callback: callback)
    }
}

private extension ItunesService {
    func fetch(request: EndPointable,  callback: @escaping (Result<ItunesResponseModel>, Data?) -> Void) {
         let task = RequestCreator.request(for: request)
        NetworkService.service.send(task, callback: callback)
     }
}
