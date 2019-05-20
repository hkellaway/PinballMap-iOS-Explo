//
//  State.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

struct State: StateType {
    let regionList: RegionList?
}

extension State: CustomStringConvertible {
    
    var description: String {
        return """
        regions: \(regionList?.alphabetized ?? [])
        """
    }
    
}
