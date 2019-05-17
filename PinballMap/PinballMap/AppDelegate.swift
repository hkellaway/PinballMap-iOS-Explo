//
//  AppDelegate.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

enum Architecture {
    case mvvm
    case redux
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencyManager: DependencyManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDependencyManager()
        return dependencyManager.navigator().installRootView()
    }

    private func setupDependencyManager() {
        self.dependencyManager = DependencyManager.shared
    }

}

