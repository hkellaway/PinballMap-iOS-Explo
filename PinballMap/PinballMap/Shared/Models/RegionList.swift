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
