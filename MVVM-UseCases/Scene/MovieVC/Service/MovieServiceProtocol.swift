//
//  MovieServiceProtocol.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation

protocol MovieServiceProtocol {
    func getTopMovieList(callback: @escaping (Result<MovieResponse>, Data?) -> Void)
}
