//
//  MovieUnitTestst.swift
//  MVVM-UseCasesTests
//
//  Created by yusuf demirkoparan on 19.09.2021.
//

import XCTest
@testable import MVVM_UseCases

class MovieUnitTestst: XCTestCase {
    
    
    var service: MovieServiceProtocol!
    
    override func setUp() {
        service = try? MoviewMockService()
    }
    
    func testSuccessMockService() throws {
        service.getTopMovieList { (result: Result<MovieResponse>, _) in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            default: break
                
            }
        }
    }
    
    func testFailMockService() throws {
        var mockService = try MoviewMockService()
        mockService.responseState = false
        service = mockService
        
        service.getTopMovieList { (result: Result<MovieResponse>, _) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
            default: break
                
            }
        }
    }
}

