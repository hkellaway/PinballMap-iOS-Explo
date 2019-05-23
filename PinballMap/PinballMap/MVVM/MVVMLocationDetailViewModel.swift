//
//  MVVMLocationDetailViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/23/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class LocationDetailViewModel {
    
    // Dependencies
    
    weak var view: MVVMLocationDetailViewController?
    let httpClient: HTTPClient
    let session: Session = Session.shared
    
    // State
    
    var machines: [Machine] {
        return view?.location?.machinesInCommon(with: allMachines).alphabetized ?? []
    }
    
    private var allMachines: MachineList = MachineList(machines: [])
    
    // MARK: -
    
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func load() {
        guard let region = session.selectedRegion else {
            assertionFailure("Unexpected state.")
            return
        }
        
        httpClient.getMachines(inRegion: region) { [weak self] result in
            switch result {
            case .success(let machines):
                self?.allMachines = machines
                self?.view?.didLoadMachines()
            case .failure(let error):
                self?.view?.errorOccurred(error)
            }
        }
    }
    
}
