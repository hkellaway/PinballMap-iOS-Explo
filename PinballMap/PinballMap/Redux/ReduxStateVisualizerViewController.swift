//
//  ReduxStateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxStateVisualizerViewController: StateVisualizerViewController {
    
    var store: Store<State>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        architectureTextField.text = "Redux"
    }
    
    override func architectureName() -> String {
        return "Redux"
    }
    
    override func stateToString() -> String {
        return store?.state?.description ?? "ERROR: No state :("
    }
    
}
