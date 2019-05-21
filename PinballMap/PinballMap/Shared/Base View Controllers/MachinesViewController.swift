//
//  MachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import TinyConstraints
import UIKit

class MachinesViewController: UIViewController {
    
    static var defaultTitle = "Machines"
    
    // UI Elements
    
    var tableView = UITableView()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateTitle(withRegion: nil)
        setupConstraints()
    }
    
    func updateTitle(withRegion region: Region?) {
        if let region = region {
            navigationItem.title = "Machines in \(region.fullName)"
        } else {
            navigationItem.title = MVVMMachinesViewController.defaultTitle
        }
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
}
