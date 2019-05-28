//
//  LocationListReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/28/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func locationListReducer(state: State?, action: Action) -> APIResponseStatus<LocationList>? {
    switch action {
    case is Clear:
        return nil
    case let action as LoadLocations:
        return action.locationList
    case let action as SelectRegion:
        // If new Region, clear Locations
        if let currentRegion = state?.selectedRegion,
            currentRegion == action.region {
            return state?.locationList
        }
        return nil
    default:
        return state?.locationList
    }
}
