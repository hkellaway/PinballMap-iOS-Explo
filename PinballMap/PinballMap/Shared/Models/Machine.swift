//
//  Machine.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct Machine: Codable {
    let id: Int
    let name: String
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension Machine: CustomStringConvertible {
    
    var description: String {
        return "\n\(name)"
    }
    
}

// MARK: Equatable

func ==(lhs: Machine, rhs: Machine) -> Bool {
    return lhs.id == rhs.id
}

extension Machine: Equatable { }
