//
//  MachineListReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/28/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func machineListReducer(state: State?, action: Action) -> APIResponseStatus<MachineList>? {
    switch action {
    case is Clear:
        return nil
    case let action as LoadMachines:
        return action.machineList
    case let action as SelectRegion:
        // If new Region, clear Locations
        if let currentRegion = state?.selectedRegion,
            currentRegion == action.region {
            return state?.machineList
        }
        return nil
    default:
        return state?.machineList
    }
}
