//
//  Navigator.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class Navigator {
    
    static var shared = Navigator()
    
    weak var viewBuilder: ViewBuilder?
    var rootWindow: UIWindow?
    var architectureSwitcher: ArchitectureSwitcher?
    var store: Store<State>?
    
    var rootTabBar: RootTabBarController?
    private var locationsNavigatonController: UINavigationController?
    private var machinesNavigationController: UINavigationController?
    private var stateNavigationController: UINavigationController?
    
    @discardableResult
    func installRootView() -> Bool {
        guard
            let regionsView = viewBuilder?.regionsViewController(),
            let machinesView = viewBuilder?.machinesViewController(),
            let stateView = viewBuilder?.stateVisualizerViewController(),
            let rootTabBar = viewBuilder?.rootTabBarController() else {
            return false
        }
        
        self.rootTabBar = rootTabBar
        
        let locationsTab = UINavigationController()
        locationsTab.tabBarItem = UITabBarItem(title: "Locations",
                                               image: nil,
                                               selectedImage: nil)
        locationsTab.pushViewController(regionsView, animated: false)
        self.locationsNavigatonController = locationsTab
        
        let machinesTab = UINavigationController()
        machinesTab.tabBarItem = UITabBarItem(title: "Machines",
                                              image: nil,
                                              selectedImage: nil)
        machinesTab.pushViewController(machinesView, animated: false)
        self.machinesNavigationController = machinesTab
        
        let stateTab = UINavigationController()
        stateTab.tabBarItem = UITabBarItem(title: "State Viz",
                                           image: nil,
                                           selectedImage: nil)
        stateTab.pushViewController(stateView, animated: false)
        self.stateNavigationController = stateTab
        
        rootTabBar.viewControllers = [locationsTab, machinesTab, stateTab]
        
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
    
    @discardableResult
    func setTabBadge(tab: RootTabBarController.Tab, value: Int) -> Bool {
        rootTabBar?.setBadge(value: value, forTab: tab)
        return true
    }
    
    @discardableResult
    func navigateToLocations(forRegion region: Region) -> Bool {
        guard
            let navController = locationsNavigatonController,
            let view = viewBuilder?.locationsViewController(region: region) else {
            return false
        }
        
        store?.dispatch(SelectRegion(region: region))
        
        navController.pushViewController(view, animated: true)
        return true
    }

    @discardableResult
    func navigateToLocationDetail(forLocation location: Location) -> Bool {
        guard
            let navController = locationsNavigatonController,
            let view = viewBuilder?.locationDetailViewController(location: location) else {
                return false
        }
        
        store?.dispatch(SelectLocation(location: location))
        
        navController.pushViewController(view, animated: true)
        return true
    }
    
    @discardableResult
    func navigateToMachineDetail(forMachine machine: Machine) -> Bool {
        guard
            let selectedTab = rootTabBar?.selectedTab,
            let navController = machinesNavigationController,
            let view = viewBuilder?.machineDetailViewController(machine: machine) else {
            return false
        }
        
        switch selectedTab {
        case .machines:
            store?.dispatch(SelectMachine(machine: machine))
            navController.pushViewController(view, animated: true)
        default:
            navController.popToRootViewController(animated: false)
            selectTab(.machines)
            navigateToMachineDetail(forMachine: machine)
        }
        return true
    }
    
}
