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
    
    // UI ELEMENTS
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Locations"
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
}
