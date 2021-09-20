//
//  NetworkResourceLoader.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

final class ResourceLoader {
    
    enum loadResources: String {
        case topMovies
       
    }
    
    static func loadAlbum(resource: loadResources) throws -> MovieResponse {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDecoder
        let album = try decoder.decode(MovieResponse.self, from: data)
        return album
    }
}
