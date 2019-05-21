//
//  LocationsViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class Session {
    
    static var shared = Session()
    
    var currentRegion: Region?
    
    func clear() {
        currentRegion = nil
    }
    
}

final class RegionViewModel {
    
    // Dependencies
    
    weak var view: MVVMRegionsViewController?
    let httpClient: HTTPClient
    let session = Session.shared
    let notificationCenter: NotificationCenter = .default
    
    // State
    
    var regions: [Region] = []
    
    // MARK -
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
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
    
    func didSelectRegion(atIndex indexPath: IndexPath) {
        let region = regions[indexPath.row]
        session.currentRegion = region
        notificationCenter.post(name: Notification.Name(rawValue: "PinballMapRegionUpdated"),
                                object: region)
    }
    
}
