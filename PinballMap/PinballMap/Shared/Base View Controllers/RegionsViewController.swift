//
//  LocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import TinyConstraints
import UIKit

class RegionsViewController: UIViewController {
    
    static var defaultTitle = "Regions"
    
    // UI ELEMENTS
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        updateTitle(withRegions: [])
    }
    
    func updateTitle(withRegions regions: [Region]) {
        if regions.isEmpty {
            navigationItem.title = RegionsViewController.defaultTitle
        } else {
            navigationItem.title = "Regions (\(regions.count))"
        }
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
}
