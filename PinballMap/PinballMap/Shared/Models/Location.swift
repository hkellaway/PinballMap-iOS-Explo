//
//  Location.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

struct Location: Codable {
    
    struct MachineXRef: Codable {
        let machineId: Int
    }
    
    var numMachines: Int {
        return machineIds.count
    }
    
    var machineIds: [Int] {
        return locationMachineXrefs.map { $0.machineId }
    }
    
    let id: Int
    let name: String
    let street: String?
    let locationMachineXrefs: [MachineXRef]
    
    func machinesInCommon(with machineList: MachineList) -> MachineList {
        let machines = machineList.machines.filter { machineIds.contains($0.id) }
        return MachineList(machines: machines)
    }
    
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
