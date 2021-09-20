//
//  FirstService.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation

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
