//
//  LocationList.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct LocationList: Codable {
    
    var alphabetized: [Location] {
        return locations.sorted {
            return $0.name < $1.name
        }
    }
    
    var count: Int {
        return locations.count
    }
    
    let locations: [Location]
    
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension LocationList: CustomStringConvertible {
    
    var description: String {
        return alphabetized.description
    }
    
}

// MARK: Equatable

func ==(lhs: LocationList, rhs: LocationList) -> Bool {
    return lhs.locations == rhs.locations
}

extension LocationList: Equatable { }
