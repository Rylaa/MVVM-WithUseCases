//
//  FirstService.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
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


struct MovieService: MovieServiceProtocol {

    func getTopMovieList(callback: @escaping (Result<MovieResponse>, Data?) -> Void) {
        let request = MovieRequestable.topMovies
        fetch(request: request, callback: callback)
    }
}

private extension MovieService {
    func fetch<T: Codable>(request: EndPointable,  callback: @escaping (Result<T>, Data?) -> Void) {
        let task = RequestCreator.request(for: request)
        NetworkService.service.send(task, callback: callback)
    }
}
