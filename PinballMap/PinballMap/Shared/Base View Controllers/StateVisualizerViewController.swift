//
//  StateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

class StateVisualizerViewController: UIViewController {
    
    @IBOutlet weak var architectureTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "State Viz"
        architectureTextField.isUserInteractionEnabled = false
        architectureTextField.text = "Unknown"
    }
    
}
