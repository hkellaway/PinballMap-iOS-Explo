//
//  MachineList.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct MachineList: Codable {
    
    var alphabetized: [Machine] {
        return machines.sorted {
            return $0.name < $1.name
        }
    }
    
    var count: Int {
        return machines.count
    }
    
    let machines: [Machine]
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension MachineList: CustomStringConvertible {
    
    var description: String {
        return alphabetized.description
    }
    
}

// MARK: Equatable

func ==(lhs: MachineList, rhs: MachineList) -> Bool {
    return lhs.machines == rhs.machines
}

extension MachineList: Equatable { }
