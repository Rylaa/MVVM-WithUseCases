//
//  NetworkResourceLoader.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

final class ResourceLoader {
    
    enum LoadItunesItems: String {
        case album
       
    }
    
    static func loadAlbum(resource: LoadItunesItems) throws -> ItunesResponseModel {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDecoder
        let album = try decoder.decode(ItunesResponseModel.self, from: data)
        return album
    }
}

