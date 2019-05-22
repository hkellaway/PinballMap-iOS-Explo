//
//  AppReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

final class AppReducer {
    
    static var shared = AppReducer()
    
    func execute(action: Action, state: State?) -> State {
        return State(
            selectedRegion: regionReducer(state: state?.selectedRegion, action: action),
            selectedLocation: locationReducer(state: state, action: action),
            selectedMachine: machineReducer(state: state, action: action),
            regionList: regionListReducer(state: state?.regionList, action: action),
            locationList: locationListReducer(state: state, action: action),
            machineList: machineListReducer(state: state, action: action)
        )
    }
    
    private func locationReducer(state: State?, action: Action) -> Location? {
        switch action {
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
    
    private func locationListReducer(state: State?, action: Action) -> LocationList? {
        switch action {
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
    
    private func machineReducer(state: State?, action: Action) -> Machine? {
        switch action {
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
    
    private func machineListReducer(state: State?, action: Action) -> MachineList? {
        switch action {
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
    
    private func regionReducer(state: Region?, action: Action) -> Region? {
        switch action {
        case let action as SelectRegion:
            return action.region
        default:
            return state
        }
    }
    
    private func regionListReducer(state: APIResponseStatus<RegionList>?, action: Action) -> APIResponseStatus<RegionList>? {
        switch action {
        case let action as LoadRegions:
            return action.regionList
        default:
            return state
        }
    }
    
}
