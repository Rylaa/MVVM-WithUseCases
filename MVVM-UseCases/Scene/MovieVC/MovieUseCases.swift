//
//  MovieUseCases.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation

final class MovieUseCases: MovieUseCasesProtocol {
    
    let service: MovieServiceProtocol!
    var response: MovieResponse?
    
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    func fetchMoview(completion: @escaping () -> Void) {
        service.getTopMovieList { [weak self] (result: Result<MovieResponse>, _) in
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let response):
                self?.response = response
                completion()
            }
        }
    }
    
    func getTenArtist() -> [ArtistResult] {
        if let strongResponse = response {
            return strongResponse.feed.results
        }
        return []
    }
    
    func getFirstArtistName() -> String {
        if let strongResponse = response {
            return strongResponse.feed.results.first?.artistName ?? ""
        }
        return ""
    }
    
    func getMovieResponse() -> MovieResponse? {
        if let strongResponse = response {
            return strongResponse
        }
        return nil
    }
}
