//
//  Region.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct Region: Codable, CustomStringConvertible {
    let id: Int
    let name: String
    let fullName: String
    
    var description: String {
        return "\n\(fullName)"
    }
}
