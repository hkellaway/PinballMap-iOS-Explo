//
//  Location.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let street: String?
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension Location: CustomStringConvertible {
    
    var description: String {
        return "\n\(name)"
    }
    
}

// MARK: Equatable

func ==(lhs: Location, rhs: Location) -> Bool {
    return lhs.id == rhs.id
}

extension Location: Equatable { }
