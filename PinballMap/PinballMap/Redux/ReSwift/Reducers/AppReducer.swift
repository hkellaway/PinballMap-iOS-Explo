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
        backgroundColor: colorReducer(state: state?.backgroundColor, action: action)
    )
}
