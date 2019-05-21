//
//  LocationDetailViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = location.name
    }
    
}
