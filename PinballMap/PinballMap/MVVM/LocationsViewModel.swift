//
//  LocationsViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class LocationsViewModel {
    
    weak var view: MVVMLocationsViewController?
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func load() {
        httpClient.getRegions { [weak self] result in
            switch result {
            case .success(let regionList):
                self?.view?.didLoadRegions(regionList.regions)
            case .failure(let error):
                self?.view?.errorOccurred(error)
            }
        }
    }
    
}
