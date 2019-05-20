//
//  Region.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct Region: Codable {
    let id: Int
    let name: String
    let fullName: String
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension Region: CustomStringConvertible {
    
    var description: String {
        return "\n\(fullName)"
    }
    
}

// MARK: Equatable

func ==(lhs: Region, rhs: Region) -> Bool {
    return lhs.id == rhs.id
}

extension Region: Equatable { }
