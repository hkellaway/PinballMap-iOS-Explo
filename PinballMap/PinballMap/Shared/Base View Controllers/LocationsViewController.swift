//
//  LocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import TinyConstraints
import UIKit

class LocationsViewController: UIViewController {
    
    // Dependencyes
    
    var region: Region!
    
    // UI Elements
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Locations for \(region.fullName)"
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
}
