//
//  ItunesDTO.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

protocol ItunesResponseProtocol {
    var idArtist: Int { get }
    var valueWrapper: String { get }
    var nameArtist: String { get }
    var typeArtist: String { get }
    var urlLinkArtist: String { get }
    var countResult: Int { get }
}

struct ItunesResponseModel: Codable {
    let results: [ItenusItemsDetails]?
    let resultCount: Int?
}

struct ItenusItemsDetails: Codable {
    let artistId: Int?
    let primaryGenreName: String?
    let wrapperType: String?
    let artistName: String?
    let artistType: String?
    let artistLinkUrl: String?
    let amgArtistId: Int?
    let primaryGenreId: Int?
}

extension ItunesResponseModel: ItunesResponseProtocol {
    var idArtist: Int {
        return results?.first?.artistId ?? 0
    }
    
    var valueWrapper: String {
        return results?.first?.wrapperType ?? ""
    }
    
    var nameArtist: String {
        return results?.first?.artistName ?? ""
    }
    
    var typeArtist: String {
        return results?.first?.artistType ?? ""
    }
    
    var urlLinkArtist: String {
        return results?.first?.artistLinkUrl ?? ""
    }
    
    var countResult: Int {
        return resultCount ?? 0
    }

}
