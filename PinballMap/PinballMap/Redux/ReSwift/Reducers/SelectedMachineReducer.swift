//
//  SelectedMachineReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/28/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func selectedMachineReducer(state: State?, action: Action) -> Machine? {
    switch action {
    case is Clear:
        return nil
    case let action as SelectMachine:
        return action.machine
    case let action as SelectRegion:
        // If new Region, clear Locations
        if let currentRegion = state?.selectedRegion,
            currentRegion == action.region {
            return state?.selectedMachine
        }
        return nil
    default:
        return state?.selectedMachine
    }
}
