//
//  StateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import TinyConstraints
import UIKit

class StateVisualizerViewController: UIViewController {
    
    // Dependencies
    
    var architectureSwitcher: ArchitectureSwitcher?
    
    // UI Elements
    
    var architectureLabel = UILabel()
    var architectureTextField = UITextField()
    var toggleArchitectureButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "State Visualizer"
        setupConstraints()
        setupDesign()
    }
    
    func architectureName() -> String {
        fatalError("Should be overridden by sub-class")
    }
    
    @objc private func didToggleArchitecture(sender: UIButton) {
        architectureSwitcher?.toggleArchitecture()
    }
    
    private func setupConstraints() {
        view.addSubview(architectureLabel)
        architectureLabel.leadingToSuperview(offset: 8)
        architectureLabel.topToSuperview(offset: 100)
        architectureLabel.trailingToSuperview(offset: 8)
        
        view.addSubview(architectureTextField)
        architectureTextField.leading(to: architectureLabel)
        architectureTextField.topToBottom(of: architectureLabel, offset: 8)
        
        view.addSubview(toggleArchitectureButton)
        toggleArchitectureButton.trailingToSuperview(offset: 8)
        toggleArchitectureButton.centerY(to: architectureTextField)
        toggleArchitectureButton.leadingToTrailing(of: architectureTextField,
                                                   offset: 8)
        toggleArchitectureButton.width(100)
    }
    
    private func setupDesign() {
        architectureLabel.text = "ARCHITECTURE:"
        architectureTextField.isUserInteractionEnabled = false
        architectureTextField.text = architectureName()
        toggleArchitectureButton.setTitle("Toggle", for: .normal)
        toggleArchitectureButton.setTitleColor(.white, for: .normal)
        toggleArchitectureButton.backgroundColor = .lightGray
        toggleArchitectureButton.addTarget(self, action: #selector(didToggleArchitecture), for: .touchUpInside)
    }
    
}
