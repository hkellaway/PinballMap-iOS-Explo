//
//  ReduxLocationDetailViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxLocationDetailViewController: LocationDetailViewController, StoreSubscriber {
    
    var store: Store<State>!
    var navigator: Navigator!
    
    private var machines: [Machine] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        machines = state.machineList == nil
            ? []
            : location.machinesInCommon(with: state.machineList!).alphabetized
        tableView.reloadData()
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension ReduxLocationDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return machines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let machine = machines[indexPath.row]
        cell.textLabel?.text = machine.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Pinball Machines (\(location.numMachines))"
        default:
            return nil
        }
    }
    
}

// MARK: UITableViewDelegate

extension ReduxLocationDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let machine = machines[indexPath.row]
        cell.isSelected = store.state.selectedMachine == machine
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let machine = machines[indexPath.row]
        navigator.navigateToMachineDetail(forMachine: machine)
    }
    
}
