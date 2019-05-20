//
//  Navigator.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

protocol ViewBuilder {
    
    func rootTabBarController() -> RootTabBarController
    func locationsViewController() -> LocationsViewController
    func machinesViewController() -> MachinesViewController
    func stateVisualizerViewController() -> StateVisualizerViewController
    
}

final class Navigator: ViewBuilder {
    
    static var shared = Navigator()
    
    weak var dependencyManager: DependencyManager?
    var rootWindow: UIWindow?
    var architecture: Architecture?
    
    private var rootTabBar: RootTabBarController?
    private var locationsNavigatonController: UINavigationController?
    private var machinesNavigationController: UINavigationController?
    private var stateNavigationController: UINavigationController?
    
    @discardableResult
    func installRootView() -> Bool {
        let locationsView = locationsViewController()
        let locationsTab = UINavigationController()
        locationsTab.tabBarItem = UITabBarItem(title: "Locations",
                                               image: nil,
                                               selectedImage: nil)
        locationsTab.pushViewController(locationsView, animated: false)
        self.locationsNavigatonController = locationsTab
        
        let machinesView = machinesViewController()
        let machinesTab = UINavigationController()
        machinesTab.tabBarItem = UITabBarItem(title: "Machines",
                                              image: nil,
                                              selectedImage: nil)
        machinesTab.pushViewController(machinesView, animated: false)
        self.machinesNavigationController = machinesTab
        
        let stateView = stateVisualizerViewController()
        let stateTab = UINavigationController()
        stateTab.tabBarItem = UITabBarItem(title: "State Viz",
                                           image: nil,
                                           selectedImage: nil)
        stateTab.pushViewController(stateView, animated: false)
        self.stateNavigationController = stateTab
        
        let rootTabBar = rootTabBarController()
        rootTabBar.viewControllers = [locationsTab, machinesTab, stateTab]
        self.rootTabBar = rootTabBar
        
        rootWindow?.rootViewController = rootTabBar
        return true
    }
    
    @discardableResult
    func selectTab(_ tab: RootTabBarController.Tab) -> Bool {
        guard let rootTabBar = rootTabBar else {
            return false
        }
        rootTabBar.selectTab(tab)
        return true
    }
    
    // MARK: - Protocol conformance
    
    // MARK: ViewBuilder
    
    func rootTabBarController() -> RootTabBarController {
        return RootTabBarController()
    }
    
    func locationsViewController() -> LocationsViewController {
        guard let architecture = architecture else {
            return LocationsViewController()
        }
        
        switch architecture {
        case .mvvm:
            return MVVMLocationsViewController()
        case .redux:
            return ReduxLocationsViewController()
        }
    }
    
    func machinesViewController() -> MachinesViewController {
        guard let architecture = architecture else {
            return MachinesViewController()
        }
        
        switch architecture {
        case .mvvm:
            return MVVMMachinesViewController()
        case .redux:
            return ReduxMachinesViewController()
        }
    }
    
    func stateVisualizerViewController() -> StateVisualizerViewController {
        guard let architecture = architecture else {
            return StateVisualizerViewController()
        }
        
        switch architecture {
        case .mvvm:
            return UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MVVMStateVisualizerViewController")
                as! MVVMStateVisualizerViewController
        case .redux:
            return UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "ReduxStateVisualizerViewController")
                as! ReduxStateVisualizerViewController
        }
    }
    
}
