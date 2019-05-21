//
//  MVVMLocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMRegionsViewController: RegionsViewController {
    
    var viewModel: RegionsViewModel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.load()
    }
    
    func didLoadRegions() {
        updateTitle(withRegions: viewModel.regions)
        tableView.reloadData()
    }
    
    func errorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSources

extension MVVMRegionsViewController: UITableViewDataSource {
    
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

extension MVVMRegionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRegion(atIndex: indexPath)
    }
    
}
