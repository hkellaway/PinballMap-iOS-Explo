//
//  MVVMStateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMStateVisualizerViewController: StateVisualizerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        architectureTextField.text = "MVVM"
    }
    
}
