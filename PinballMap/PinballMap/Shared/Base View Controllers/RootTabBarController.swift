//
//  RootTabBarController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class RootTabBarController: UITabBarController {
    
    enum Tab: Int {
        case locations = 0
        case machines = 1
        case stateVisualizer = 2
    }
    
    func selectTab(_ tab: Tab) {
        selectedIndex = tab.rawValue
    }
    
}
