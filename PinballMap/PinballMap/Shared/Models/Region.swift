//
//  Region.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct Region {
    let id: Int
    let name: String
    let fullName: String
    
    // SwifUI
    var isSelected: Bool = false
    
    init(id: Int, name: String, fullName: String, isSelected: Bool = false) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.isSelected = isSelected
    }
}

// MARK: - Protocol conformance

// MARK: Codable

extension Region: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let id = try values.decode(Int.self, forKey: .id)
        let name = try values.decode(String.self, forKey: .name)
        let fullName = try values.decode(String.self, forKey: .fullName)
        self.init(id: id, name: name, fullName: fullName)
    }
    
}

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
