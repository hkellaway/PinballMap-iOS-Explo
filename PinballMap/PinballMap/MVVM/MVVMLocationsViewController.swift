//
//  MVVMLocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMLocationsViewController: LocationsViewController {
    
    var session: Session! = Session.shared
    
    override func regionName() -> String {
        return session.currentRegion?.fullName ?? "UNKNOWN"
    }
    
}
