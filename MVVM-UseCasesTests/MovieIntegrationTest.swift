//
//  MovieIntegrationTest.swift
//  MVVM-UseCasesTests
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import XCTest
@testable import MVVM_UseCases

class MVVM_UseCasesTests: XCTestCase {
    
    var service: MovieServiceProtocol!
    
    override func setUp() {
        super.setUp()
        service = MovieService()
    }
    
    func testIntegration() {
        let expectation = self.expectation(description: "Integration test #1")
        
        service.getTopMovieList { (result: Result<MovieResponse>, nil)  in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            default:
                break
                
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
