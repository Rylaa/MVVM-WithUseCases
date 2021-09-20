//
//  FirstContracts.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation


protocol MovieVMProtocol: AnyObject {
    var delegate: MovieVMDelegateProtocol? { get set }
    func getTenArtist()
    func getFirstArtistName()
    func fetchMovies()
}

protocol MovieVMDelegateProtocol: AnyObject {
    func viewModelOutputs(with output: MovieVMOutputs)
}

enum MovieVMOutputs {
    case MoviewData(MovieResponse)
    case GiveFirstTenArtist([ArtistResult])
    case GiveFirstArtistName(String)
}
