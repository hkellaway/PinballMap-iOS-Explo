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
            return ReduxViewController()
        }
    }
    
}
