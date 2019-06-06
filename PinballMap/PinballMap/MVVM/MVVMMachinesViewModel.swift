//
//  MVVMMachinesViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/22/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class MachinesViewModel {
    
    // Dependencies
    
    weak var view: MVVMMachinesViewController?
    let httpClient: PinballMapHTTPClient
    let navigator: Navigator
    let session: Session = Session.shared
    let notificationCenter: NotificationCenter = .default
    
    // State
    
    var machines: [Machine] = []
    
    // MARK: -
    
    init(httpClient: PinballMapHTTPClient, navigator: Navigator) {
        self.httpClient = httpClient
        self.navigator = navigator
    }
    
    func load(forRegion region: Region) {
        httpClient.getMachines(inRegion: region) { [weak self] result in
            switch result {
            case .success(let machineList):
                self?.machines = machineList.alphabetized
                self?.view?.didLoadMachines()
            case .failure(let error):
                self?.view?.errorOccurred(error)
            }
        }
    }
    
    func didSelectMachine(atIndex indexPath: IndexPath) {
        let machine = machines[indexPath.row]
        session.selectedMachine = machine
        notificationCenter.post(name: .machineSelected,
                                object: machine)
        navigator.navigateToMachineDetail(forMachine: machine)
    }
    
}
