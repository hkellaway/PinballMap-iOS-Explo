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
            regionList: regionListReducer(state: state?.regionList, action: action)
        )
    }
    
    private func regionReducer(state: Region?, action: Action) -> Region? {
        switch action {
        case let action as SelectRegion:
            return action.region
        default:
            return state
        }
    }
    
    private func regionListReducer(state: RegionList?, action: Action) -> RegionList? {
        switch action {
        case let action as LoadRegions:
            return action.regions
        default:
            return state
        }
    }
    
}
