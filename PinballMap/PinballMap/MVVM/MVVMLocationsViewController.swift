//
//  MVVMLocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMLocationsViewController: LocationsViewController {
    
    var viewModel: LocationsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.load()
    }
    
    func didLoadRegions() {
        tableView.reloadData()
    }
    
    func errorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSources

extension MVVMLocationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let region = viewModel.regions[indexPath.row]
        cell.textLabel?.text = region.fullName
        return cell
    }
    
}

// MARK: UITableViewDelegate

extension MVVMLocationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRegion(atIndex: indexPath)
    }
    
}
