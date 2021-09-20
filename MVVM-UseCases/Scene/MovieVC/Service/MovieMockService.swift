//
//  MovieMockService.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 19.09.2021.
//

import Foundation

struct MoviewMockService: MovieServiceProtocol {
    
    let movieData: MovieResponse!
    public var responseState: Bool = true
    
    
    init() throws {
        movieData = try ResourceLoader.loadAlbum(resource: .topMovies)
        
    }
    
    private enum Error: Swift.Error {
        case serializationError
    }
    
    func getTopMovieList(callback: @escaping (Result<MovieResponse>, Data?) -> Void) {
        responseState
            ? callback(.success(movieData), nil)
            : callback(.failure(Error.serializationError), nil)
    }
    
}
