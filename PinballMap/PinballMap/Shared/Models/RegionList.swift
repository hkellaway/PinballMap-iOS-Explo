//
//  RegionList.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct RegionList: Codable {
    
    var alphabetized: [Region] {
        return regions.sorted {
            return $0.fullName < $1.fullName
        }
    }
    
    let regions: [Region]
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension RegionList: CustomStringConvertible {
    
    var description: String {
        return alphabetized.description
    }
    
}

// MARK: Equatable

func ==(lhs: RegionList, rhs: RegionList) -> Bool {
    return lhs.regions == rhs.regions
}

extension RegionList: Equatable { }
