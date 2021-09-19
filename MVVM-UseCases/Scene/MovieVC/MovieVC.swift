//
//  MovieVC.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 17.09.2021.
//

import Foundation
import UIKit

class MovieVC: UIViewController {
    
    var viewModel: MovieVMProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.viewModel.getTenArtist()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.viewModel.getFirstArtistName()
        }
    }
}

extension MovieVC: MovieVMDelegate {
    func viewModelOutputs(with output: MovieVMOutputs) {
        switch output {
        case .GiveFirstArtistName(let name):
            print(name)
        case .GiveFirstTenArtist(let artists):
            print(artists)
        case .MoviewData(let response):
            print(response)
        }
    }
}

extension MovieVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .moviePage }
}
