//
//  ColorReducer.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

func colorReducer(state: UIColor?, action: Action) -> UIColor {
    switch action {
    case let action as SetBackgroundColor:
        return action.color
    default:
        return .black
    }
}
