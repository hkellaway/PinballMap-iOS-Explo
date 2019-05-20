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
    func switchArchitecture(to newArchitecture: Architecture) -> Bool
    
}
