//
//  MachineDetailViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

class MachineDetailViewController: UIViewController {
    
    var machine: Machine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = machine.name
    }
    
}
