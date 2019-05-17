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
            backgroundColor: colorReducer(state: state?.backgroundColor, action: action)
        )
    }
    
    private func colorReducer(state: UIColor?, action: Action) -> UIColor {
        switch action {
        case let action as SetBackgroundColor:
            return action.color
        default:
            return .black
        }
    }
    
}
