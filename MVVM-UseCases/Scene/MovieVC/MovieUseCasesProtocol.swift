//
//  MovieUseCasesProtocol.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation

protocol MovieUseCasesProtocol: AnyObject {
    func getTenArtist() -> [ArtistResult]
    func getFirstArtistName() -> String
    func getMovieResponse() -> MovieResponse?
    func fetchMoview(completion: @escaping () -> Void)
}

