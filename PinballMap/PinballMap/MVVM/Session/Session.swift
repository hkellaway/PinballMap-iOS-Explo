//
//  Session.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class Session {
    
    static var shared = Session()
    
    var currentRegion: Region?
    var currenLocation: Location?
    var currentMachine: Machine?
    
    func clear() {
        currentRegion = nil
        currenLocation = nil
        currentMachine = nil
    }
    
}
