//
//  ItunesMockService.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

final class MockFetchItunesItems: FetchItunesItemsProtocol {
    
    let album: ItunesResponseProtocol!
    
    public var isSuccessState: Bool = true
    
    private enum Error: Swift.Error {
        case serializationError
    }

    init(album: ItunesResponseProtocol) {
        self.album = album
    }
    
    func fetchItunesItems(request: EndPointable,  callback: @escaping (Result<ItunesResponseModel>, Data?) -> Void) {
        isSuccessState
            ? callback(.success(album as! ItunesResponseModel), nil)
            : callback(.failure(Error.serializationError), nil)
    }
}
