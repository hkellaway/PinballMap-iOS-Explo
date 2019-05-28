//
//  SelectedLocationReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/28/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func selectedLocationReducer(state: State?, action: Action) -> Location? {
    switch action {
    case is Clear:
        return nil
    case let action as SelectLocation:
        return action.location
    case let action as SelectRegion:
        // If new Region, clear Locations
        if let currentRegion = state?.selectedRegion,
            currentRegion == action.region {
            return state?.selectedLocation
        }
        return nil
    default:
        return state?.selectedLocation
    }
}
