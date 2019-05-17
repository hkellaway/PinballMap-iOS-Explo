//
//  DependencyManager.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class DependencyManager {
    
    static var shared = DependencyManager()
    
    private var rootWindow: UIWindow?
    
    init(rootWindow: UIWindow? = UIApplication.shared.delegate?.window as? UIWindow,
         architecture: Architecture = .redux) {
        Navigator.shared.rootWindow = rootWindow
        Navigator.shared.architecture = architecture
        Navigator.shared.dependencyManager = self
    }
    
    // MARK: - Redux
    
    func store() -> Store<State> {
        return StateStore.shared
    }
    
    // MARK: - Shared
    
    func navigator() -> Navigator {
        return Navigator.shared
    }
    
}
