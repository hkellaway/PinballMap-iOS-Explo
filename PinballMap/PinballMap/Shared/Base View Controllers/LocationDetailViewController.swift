//
//  LocationDetailViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import TinyConstraints
import UIKit

class LocationDetailViewController: UIViewController {
    
    // Dependencies
    
    var location: Location?
    
    // UI Elements
    
    lazy var addressStreetLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var tableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = location?.name ?? "NONE"
        setupConstraints()
        
        let streetString = location?.street ?? "NONE"
        addressStreetLabel.text = """
        Street:\n
        \(streetString)
        """
    }
    
    func clear() {
        navigationItem.title = nil
        addressStreetLabel.text = nil
    }
    
    private func setupConstraints() {
        view.addSubview(addressStreetLabel)
        addressStreetLabel.topToSuperview(offset: 100)
        addressStreetLabel.leadingToSuperview(offset:20)
        
        view.addSubview(tableView)
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.bottomToSuperview()
        tableView.topToBottom(of: addressStreetLabel, offset: 20)
    }
    
}
