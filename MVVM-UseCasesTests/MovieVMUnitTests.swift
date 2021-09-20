//
//  MovieVMUnitTests.swift
//  MVVM-UseCasesTests
//
//  Created by yusuf demirkoparan on 20.09.2021.
//

import XCTest
@testable import MVVM_UseCases

class MovieVMUnitTests: XCTestCase {
    
    var viewModel: MovieVMProtocol!
    var service: MovieServiceProtocol!
    var viewModelOutputDelegate: DisplayDelegateOutputs!
    
    override func setUp() {
        viewModelOutputDelegate = DisplayDelegateOutputs()
        service = try? MoviewMockService()
        viewModel = MovieVM(service: service)
        viewModel.delegate = viewModelOutputDelegate
        viewModel.fetchMovies()
    }
    
 
    func testFetchTenArtist() {
        viewModel.getTenArtist()
    }
    
    func testFetchArtistName() {
        viewModel.getFirstArtistName()
    }
}


class DisplayDelegateOutputs: MovieVMDelegateProtocol {
    
    private(set) var response: MovieResponse?
    private(set) var artistName: String?
    private(set) var list: [ArtistResult] = []
    
    
    func viewModelOutputs(with output: MovieVMOutputs) {
        switch output {
        case .MoviewData(let data):
            self.response = data
            
        case .GiveFirstArtistName(let name):
            self.artistName = name
            
        case .GiveFirstTenArtist(let artistList):
            self.list = artistList
            
        }
    }
}
