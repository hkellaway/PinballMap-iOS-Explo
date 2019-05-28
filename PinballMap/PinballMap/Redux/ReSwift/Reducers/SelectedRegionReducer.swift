//
//  SelectedRegionReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/28/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func selectedRegionReducer(state: Region?, action: Action) -> Region? {
    switch action {
    case is Clear:
        return nil
    case let action as SelectRegion:
        return action.region
    default:
        return state
    }
}
