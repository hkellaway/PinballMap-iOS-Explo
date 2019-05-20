//
//  AppDelegate.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ArchitectureSwitcher {

    var window: UIWindow?
    var dependencyManager: DependencyManager!
    
    var currentArchitecture: Architecture {
        return dependencyManager.architecture
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialArchitecture: Architecture = .mvvm
        setupDependencyManager(architecture: initialArchitecture)
        
        assert(
            dependencyManager.architecture == initialArchitecture,
            "Invalid launch state"
        )
        
        return startApp()
    }
    
    @discardableResult
    func startApp() -> Bool {
        return dependencyManager.navigator().installRootView()
            && dependencyManager.navigator().selectTab(.stateVisualizer)
    }
    
    @discardableResult
    func restartApp(architecture: Architecture) -> Bool {
        dependencyManager.clearState()
        dependencyManager.architecture = architecture
        return startApp()
    }

    private func setupDependencyManager(architecture: Architecture) {
        let dependencyManager = DependencyManager.shared
        dependencyManager.architecture = architecture
        self.dependencyManager = dependencyManager
    }

}

// MARK: - Protocol conformance

// MARK: ArchitectureSwitcher

extension AppDelegate {
    
    func switchArchitecture(to newArchitecture: Architecture) -> Bool {
        guard newArchitecture != currentArchitecture else {
            return true
        }
        return restartApp(architecture: newArchitecture)
    }
    
}
