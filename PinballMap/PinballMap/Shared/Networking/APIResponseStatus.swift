//
//  APIResponseStatus.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import HottPotato

enum APIResponseStatus<T: Decodable & Equatable & CustomStringConvertible>: CustomStringConvertible {
    case loading
    case loaded(success: T)
    case errored(failure: HottPotatoError)
    
    var value: T? {
        switch self {
        case .loaded(let value):
            return value
        default:
            return nil
        }
    }
    
    var description: String {
        switch self {
        case .loading:
            return "LOADING..."
        case .loaded(let value):
            return value.description
        case .errored(let error):
            return "ERROR: \(error.localizedDescription)"
        }
    }
    
}

// MARK: - Protocol conformance

// MARK: Equatable

func ==<T>(lhs: APIResponseStatus<T>, rhs: APIResponseStatus<T>) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
        return true
    case (.loaded(let value1), .loaded(let value2)):
        return value1 == value2
    case (.errored(let error1), .errored(let error2)):
        return error1 == error2
    default:
        return false
    }
}

extension APIResponseStatus: Equatable { }
