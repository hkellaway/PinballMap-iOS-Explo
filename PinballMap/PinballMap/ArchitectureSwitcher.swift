//
//  ArchitectureSwitcher.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

protocol ArchitectureSwitcher {
    
    var currentArchitecture: Architecture { get }
    func toggleArchitecture() -> Bool
    func switchArchitecture(to newArchitecture: Architecture) -> Bool
    
}

extension ArchitectureSwitcher {
    
    func toggleArchitecture() -> Bool {
        switch currentArchitecture {
        case .mvvm:
            return switchArchitecture(to: .redux)
        case .redux:
            return switchArchitecture(to: .mvvm)
        }
    }
    
}
