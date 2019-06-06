//
//  LocationsViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class RegionsViewModel {
    
    // Dependencies
    
    weak var view: MVVMRegionsViewController?
    let httpClient: PinballMapHTTPClient
    let session = Session.shared
    let notificationCenter: NotificationCenter = .default
    let navigator: Navigator
    
    // State
    
    var regions: [Region] = []
    
    // MARK -
    
    init(httpClient: PinballMapHTTPClient, navigator: Navigator) {
        self.httpClient = httpClient
        self.navigator = navigator
    }
    
    func load() {
        httpClient.getRegions { [weak self] result in
            switch result {
            case .success(let regionList):
                self?.regions = regionList.alphabetized
                self?.view?.didLoadRegions()
            case .failure(let error):
                self?.view?.errorOccurred(error)
            }
        }
    }
    
    func isCurrentRegion(atIndex indexPath: IndexPath) -> Bool {
        let region = regions[indexPath.row]
        return session.selectedRegion == region
    }
    
    func didSelectRegion(atIndex indexPath: IndexPath) {
        let region = regions[indexPath.row]
        session.selectedRegion = region
        session.selectedLocation = nil
        session.selectedMachine = nil
        notificationCenter.post(name: .regionUpdated,
                                object: region)
        navigator.navigateToLocations(forRegion: region)
    }
    
}
