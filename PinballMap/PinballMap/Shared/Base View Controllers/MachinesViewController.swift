//
//  MachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

class MachinesViewController: UIViewController {
    
    static var defaultTitle = "Machines"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateTitle(withRegion: nil)
    }
    
    func updateTitle(withRegion region: Region?) {
        if let region = region {
            navigationItem.title = "Machines in \(region.fullName)"
        } else {
            navigationItem.title = MVVMMachinesViewController.defaultTitle
        }
    }
    
}
