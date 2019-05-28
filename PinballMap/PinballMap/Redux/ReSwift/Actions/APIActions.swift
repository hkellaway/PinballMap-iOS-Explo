//
//  APIActions.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

final class APIActions {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadRegions(state: State, store: Store<State>) -> Action? {
        httpClient.getRegions { result in
            switch result {
            case .success(let regionList):
                store.dispatch(LoadRegions(regionList: .loaded(success: regionList)))
            case .failure(let error):
                store.dispatch(LoadRegions(regionList: .errored(failure: error)))
            }
        }
        return LoadRegions(regionList: .loading)
    }
    
    func loadLocations(state: State, store: Store<State>) -> Action? {
        guard let selectedRegion = state.selectedRegion else {
            return nil
        }
        httpClient.getLocations(inRegion: selectedRegion) { result in
            switch result {
            case .success(let locationList):
                store.dispatch(LoadLocations(locationList: .loaded(success: locationList)))
            case .failure(let error):
                store.dispatch(LoadLocations(locationList: .errored(failure: error)))
            }
        }
        return LoadLocations(locationList: .loading)
    }
    
    func loadMachines(state: State, store: Store<State>) -> Action? {
        guard let selectedRegion = state.selectedRegion else {
            return nil
        }
        httpClient.getMachines(inRegion: selectedRegion) { result in
            switch result {
            case .success(let machineList):
                store.dispatch(LoadMachines(machineList: .loaded(success: machineList)))
            case .failure(let error):
                store.dispatch(LoadMachines(machineList: .errored(failure: error)))
            }
        }
        return LoadMachines(machineList: .loading)
    }
    
}
