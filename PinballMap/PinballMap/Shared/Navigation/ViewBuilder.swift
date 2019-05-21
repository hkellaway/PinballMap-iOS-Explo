//
//  ViewBuilder.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

protocol ViewBuilder: class {
    
    func rootTabBarController() -> RootTabBarController
    func locationsViewController() -> RegionsViewController
    func machinesViewController() -> MachinesViewController
    func stateVisualizerViewController() -> StateVisualizerViewController
    
}
