//
//  MVVMLocationDetailViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMLocationDetailViewController: LocationDetailViewController {
    
    var viewModel: LocationDetailViewModel!
    var session: Session! = Session.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.showActivityIndicator()
        viewModel.load()
    }
    
    func didLoadMachines() {
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

extension MVVMLocationDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.machines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let machine = viewModel.machines[indexPath.row]
        cell.textLabel?.text = machine.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return location == nil ? nil : "Pinball Machines (\(location!.numMachines))"
        default:
            return nil
        }
    }
    
}

// MARK: UITableViewDelegate

extension MVVMLocationDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let machine = viewModel.machines[indexPath.row]
        cell.isSelected = session.selectedMachine == machine
    }
    
}
