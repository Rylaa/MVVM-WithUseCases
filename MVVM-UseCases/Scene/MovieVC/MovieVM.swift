//
//  MovieVM.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation


final class MovieVM: MovieVMProtocol {
   
    weak var delegate: MovieVMDelegate?
    let useCases: MovieUseCasesProtocol!
    let service: MovieServiceProtocol!
    
    init(service: MovieServiceProtocol) {
        self.service = service
        self.useCases = MovieUseCases(service: service)
    }
    
    func fetchMovies() {
        useCases.fetchMoview()
    }
    
    private func notifyToOutputsVC(output: MovieVMOutputs) {
        delegate?.viewModelOutputs(with: output)
    }
    
    func getTenArtist() {
        notifyToOutputsVC(output: .GiveFirstTenArtist(useCases.getTenArtist()))
    }
    
    func getFirstArtistName() {
        notifyToOutputsVC(output: .GiveFirstArtistName(useCases.getFirstArtistName()))
    }
    
    func getMovieResponse() {
        notifyToOutputsVC(output: .MoviewData(useCases.getMovieResponse()!))
    }
}
