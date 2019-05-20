//
//  DependencyManager.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import HottPotato
import ReSwift
import UIKit

final class DependencyManager {
    
    static var shared = DependencyManager()
    
    var architecture: Architecture = .mvvm
    
    init(rootWindow: UIWindow? = UIApplication.shared.delegate?.window as? UIWindow,
         architectureSwitcher: ArchitectureSwitcher? = UIApplication.shared.delegate as? AppDelegate) {
        navigator().rootWindow = rootWindow
        navigator().architectureSwitcher = architectureSwitcher
        navigator().dependencyManager = self
    }
    
    // MARK: - Shared
    
    func httpClient() -> HTTPClient {
        return HTTPClient.shared
    }
    
    // MARK: - Redux
    
    func store() -> Store<State> {
        return MyStore.shared
    }
    
    // MARK: - Shared
    
    func navigator() -> Navigator {
        return Navigator.shared
    }
    
}
