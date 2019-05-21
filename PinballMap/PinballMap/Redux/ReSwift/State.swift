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
    
    var numRegions: Int {
        return regionList?.count ?? 0
    }
    
    let selectedRegion: Region?
    let regionList: RegionList?
    let locationList: LocationList?
    
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension State: CustomStringConvertible {
    
    var description: String {
        let selectedRegionString = selectedRegion?.description ?? "NONE"
        return """
        SELECTED REGION: \(selectedRegionString)
        NUM REGIONS: \(regionList?.count ?? 0)
        REGIONS: \(regionList?.description ?? [].description)
        LOCATIONS: \(locationList?.description ?? [].description)
        """
    }
    
}

// MARK: Equatable

func ==(lhs: State, rhs: State) -> Bool {
    return lhs.selectedRegion == rhs.selectedRegion &&
        lhs.regionList == rhs.regionList &&
        lhs.locationList == rhs.locationList
}

extension State: Equatable { }
