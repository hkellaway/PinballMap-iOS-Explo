//
//  MVVMMachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMMachinesViewController: MachinesViewController {
    
    let viewModel: MachinesViewModel
    let notificationCenter: NotificationCenter! = .default
    let session: Session! = Session.shared
    let navigator: Navigator
    
    init(viewModel: MachinesViewModel, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(regionUpdated(notification:)),
                                       name: .regionUpdated,
                                       object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        notificationCenter.removeObserver(self,
                                          name: .regionUpdated,
                                          object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTitle(withRegion: session.selectedRegion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func didLoadMachines() {
        view.hideActivityIndicator()
        navigator.setTabBadge(tab: .machines,
                              value: viewModel.machines.count)
        tableView.reloadData()
    }
    
    func errorOccurred(_ error: Error) {
        view.hideActivityIndicator()
        displayError(error)
    }
    
    @objc private func regionUpdated(notification: Notification) {
        guard let region = notification.object as? Region else {
            return
        }
        updateTitle(withRegion: region)
        navigator.setTabBadge(tab: .machines, value: 0)
        view.showActivityIndicator()
        viewModel.load(forRegion: region)
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension MVVMMachinesViewController: UITableViewDataSource {
    
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
    
}

// MARK: UITableViewDelegate

extension MVVMMachinesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let machine = viewModel.machines[indexPath.row]
        cell.isSelected = session.selectedMachine == machine
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectMachine(atIndex: indexPath)
    }
    
}
