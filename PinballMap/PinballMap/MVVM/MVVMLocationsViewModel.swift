//
//  MVVMLocationsViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/22/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class LocationsViewModel {
    
    // Dependencies
    
    weak var view: MVVMLocationsViewController?
    let httpClient: HTTPClient
    let session = Session.shared
    
    // State
    
    var locations: [Location] = []
    
    // MARK: -
    
    init(httpClient: HTTPClient,
         navigator: Navigator) {
        self.httpClient = httpClient
    }
    
    func load(forRegion region: Region) {
        httpClient.getLocations(inRegion: region) { [weak self] result in
            switch result {
            case .success(let locationList):
                self?.locations = locationList.alphabetized
                self?.view?.didLoadLocations()
            case .failure(let error):
                self?.view?.errorOccurred(error)
            }
        }
    }
    
    func isCurrentLocation(atIndex indexPath: IndexPath) -> Bool {
        let location = locations[indexPath.row]
        return session.selectedLocation == location
    }
    
    func didSelectLocation(atIndex indexPath: IndexPath) {
        let location = locations[indexPath.row]
        session.selectedLocation = location
    }

}
