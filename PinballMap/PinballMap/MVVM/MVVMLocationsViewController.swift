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
        
        view.showActivityIndicator()
        viewModel.load(forRegion: region)
    }
    
    func didLoadLocations() {
        view.hideActivityIndicator()
        tableView.reloadData()
    }
    
    func errorOccurred(_ error: Error) {
        view.hideActivityIndicator()
        displayError(error)
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension MVVMLocationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let location = viewModel.locations[indexPath.row]
        cell.textLabel?.text = location.name
        return cell
    }
    
}

// MARK: UITableViewDelegate

extension MVVMLocationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.isSelected = viewModel.isCurrentLocation(atIndex: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectLocation(atIndex: indexPath)
    }
    
}
