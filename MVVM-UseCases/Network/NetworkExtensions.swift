//
//  NetworkExtensions.swift
//  MVVM-UseCases
//
//  Created by yusuf demirkoparan on 16.09.2021.
//

import Foundation

extension Bundle {
    class DummyBundle { }
    static let test = Bundle(for: DummyBundle.self)
}

extension Optional {
    
    struct FoundNilWhileUnwrappingError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
