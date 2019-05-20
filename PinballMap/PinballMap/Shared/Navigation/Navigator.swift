//
//  Navigator.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

protocol ViewBuilder {
    
    func rootViewController() -> ViewController
    func rootTabBarController() -> RootTabBarController
    func locationsViewController() -> LocationsViewController
    func machinesViewController() -> MachinesViewController
    func stateVisualizerViewController() -> StateVisualizerViewController
    
}

final class Navigator: ViewBuilder {
    
    static var shared = Navigator()
    
    weak var dependencyManager: DependencyManager?
    var rootWindow: UIWindow?
    var architecture: Architecture!
    
    func installRootView() -> Bool {
        rootWindow?.rootViewController = rootViewController()
        return true
    }
    
    // MARK: - Protocol conformance
    
    // MARK: ViewBuilder
    
    func rootViewController() -> ViewController {
        switch architecture! {
        case .mvvm:
            let viewModel = ViewModel()
            let view = MVVMViewController()
            viewModel.view = view
            view.viewModel = viewModel
            return view
        case .redux:
            let view = ReduxViewController()
            view.store = dependencyManager?.store()
            return view
        }
    }
    
    func rootTabBarController() -> RootTabBarController {
        return RootTabBarController()
    }
    
    func locationsViewController() -> LocationsViewController {
        switch architecture! {
        case .mvvm:
            return MVVMLocationsViewController()
        case .redux:
            return ReduxLocationsViewController()
        }
    }
    
    func machinesViewController() -> MachinesViewController {
        switch architecture! {
        case .mvvm:
            return MVVMMachinesViewController()
        case .redux:
            return ReduxMachinesViewController()
        }
    }
    
    func stateVisualizerViewController() -> StateVisualizerViewController {
        switch architecture! {
        case .mvvm:
            return MVVMStateVisualizerViewController()
        case .redux:
            return ReduxStateVisualizerViewController()
        }
    }
    
}
