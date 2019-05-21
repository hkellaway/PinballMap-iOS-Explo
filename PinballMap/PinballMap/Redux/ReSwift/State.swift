//
//  State.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

struct State: StateType {
    let selectedRegion: Region?
    let selectedLocation: Location?
    let selectedMachine: Machine?
    let regionList: RegionList?
    let locationList: LocationList?
    let machineList: MachineList?
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension State: CustomStringConvertible {
    
    var description: String {
        let selectedRegionString = selectedRegion?.description ?? "NONE"
        let selectedLocationString = selectedLocation?.description ?? "NONE"
        let selectedMachineString = selectedMachine?.description ?? "NONE"
        return """
        SELECTED REGION: \(selectedRegionString)
        SELECTED LOCATION: \(selectedLocationString)
        SELECTED MACHINE: \(selectedMachineString)
        \n
        NUM REGIONS: \(regionList?.count ?? 0)
        REGIONS: \(regionList?.description ?? [].description)
        NUM LOCATONS: \(locationList?.count ?? 0)
        LOCATIONS: \(locationList?.description ?? [].description)
        NUM MACHINES: \(machineList?.count ?? 0)
        MACHINES: \(machineList?.description ?? [].description)
        """
    }
    
}

// MARK: Equatable

func ==(lhs: State, rhs: State) -> Bool {
    return lhs.selectedRegion == rhs.selectedRegion &&
        lhs.selectedLocation == rhs.selectedLocation &&
        lhs.selectedMachine == rhs.selectedMachine &&
        lhs.regionList == rhs.regionList &&
        lhs.locationList == rhs.locationList &&
        lhs.machineList == rhs.machineList
}

extension State: Equatable { }
