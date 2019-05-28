//
//  RegionListReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/28/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

func regionListReducer(state: APIResponseStatus<RegionList>?, action: Action) -> APIResponseStatus<RegionList>? {
    switch action {
    case is Clear:
        return nil
    case let action as LoadRegions:
        return action.regionList
    default:
        return state
    }
}
