//
//  FirstContracts.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation


protocol MovieVMProtocol: AnyObject {
    var delegate: MovieVMDelegate? { get set }
    func getTenArtist()
    func getFirstArtistName()
    func getMovieResponse()
    func fetchMovies()
}

protocol MovieVMDelegate: AnyObject {
    func viewModelOutputs(with output: MovieVMOutputs)
}

enum MovieVMOutputs {
    case MoviewData(MovieResponse)
    case ArtistList([ArtistResult])
    case GiveFirstTenArtist([ArtistResult])
    case GiveFirstArtistName(String)
}
