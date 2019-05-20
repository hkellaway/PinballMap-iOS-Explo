//
//  AppDelegate.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencyManager: DependencyManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDependencyManager()
        dependencyManager.navigator().installRootView()
        dependencyManager.navigator().selectTab(.locations)
        
        assert(dependencyManager.navigator().architecture != nil,
               "Invalid launch state")
        
        return true
    }

    private func setupDependencyManager() {
        let dependencyManager = DependencyManager.shared
        dependencyManager.navigator().architecture = .mvvm
        self.dependencyManager = dependencyManager
    }

}

