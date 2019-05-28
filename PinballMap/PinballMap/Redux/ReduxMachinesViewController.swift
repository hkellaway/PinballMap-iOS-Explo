//
//  ReduxMachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxMachinesViewController: MachinesViewController, StoreSubscriber {
    
    let navigator: Navigator
    
    private var machines: [Machine] = []
    
    init(navigator: Navigator) {
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
        
        store.subscribe(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    deinit {
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        guard let machineList = state.machineList else {
            let noMachines = MachineList(machines: [])
            displayMachines(noMachines, forRegion: state.selectedRegion)
            return
        }
        
        switch machineList {
        case .loading:
            view.showActivityIndicator()
        case .loaded(let machineList):
            displayMachines(machineList, forRegion: state.selectedRegion)
        case .errored(let error):
            view.hideActivityIndicator()
            displayError(error)
        }
    }
    
    private func displayMachines(_ machineList: MachineList,
                                 forRegion region: Region?) {
        view.hideActivityIndicator()
        updateTitle(withRegion: region)
        self.machines = machineList.alphabetized
        navigator.setTabBadge(tab: .machines, value: machineList.count)
        tableView.reloadData()
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension ReduxMachinesViewController: UITableViewDataSource {
    
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
    
}

// MARK: UITableViewDelegate

extension ReduxMachinesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let machine = machines[indexPath.row]
        cell.isSelected = store.state.selectedMachine == machine
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let machine = machines[indexPath.row]
        navigator.navigateToMachineDetail(forMachine: machine)
    }
    
}
