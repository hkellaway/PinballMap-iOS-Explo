//
//  ReduxStateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class ReduxStateVisualizerViewController: StateVisualizerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        architectureTextField.text = "Redux"
    }
    
    override func architectureName() -> String {
        return "Redux"
    }
    
}
