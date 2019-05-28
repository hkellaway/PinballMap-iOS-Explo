//
//  AppReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: State?) -> State {
    return State(
        selectedRegion: selectedRegionReducer(state: state?.selectedRegion, action: action),
        selectedLocation: selectedLocationReducer(state: state, action: action),
        selectedMachine: selectedMachineReducer(state: state, action: action),
        regionList: regionListReducer(state: state?.regionList, action: action),
        locationList: locationListReducer(state: state, action: action),
        machineList: machineListReducer(state: state, action: action)
    )
}
