//
//  DependencyManager.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import HottPotato
import ReSwift
import UIKit

final class DependencyManager: ViewBuilder {
    
    static var shared = DependencyManager()
    
    var architecture: Architecture = .mvvm
    weak var architectureSwitcher: ArchitectureSwitcher?
    
    init(rootWindow: UIWindow? = UIApplication.shared.delegate?.window as? UIWindow,
         architectureSwitcher: ArchitectureSwitcher? = UIApplication.shared.delegate as? AppDelegate) {
        self.architectureSwitcher = architectureSwitcher
        
        navigator().rootWindow = rootWindow
        navigator().viewBuilder = self
    }
    
    // MARK: - Instance functions
    
    func clearState() {
        switch architecture {
        case .redux:
            store().state = State(selectedRegion: nil,
                                  selectedLocation: nil,
                                  selectedMachine: nil,
                                  regionList: nil,
                                  locationList: nil,
                                  machineList: nil)
        case .mvvm:
            Session.shared.clear()
        }
    }
    
    // MARK: - Dependencies
    
    // MARK: Redux-specific
    
    func store() -> Store<State> {
        return MyStore.shared
    }
    
    // MARK: Shared
    
    func httpClient() -> HTTPClient {
        return HTTPClient.shared
    }
    
    func navigator() -> Navigator {
        return Navigator.shared
    }
    
    // MARK: ViewBuilder
    
    func rootTabBarController() -> RootTabBarController {
        return RootTabBarController()
    }
    
    func regionsViewController() -> RegionsViewController {
        switch architecture {
        case .mvvm:
            let view = MVVMRegionsViewController()
            let viewModel = RegionsViewModel(httpClient: httpClient(),
                                             navigator: navigator())
            view.viewModel = viewModel
            viewModel.view = view
            return view
        case .redux:
            let view = ReduxRegionsViewController()
            view.apiActions = APIActions(httpClient: httpClient(),
                                         store: store())
            view.store = store()
            view.navigator = navigator()
            return view
        }
    }
    
    func locationsViewController(region: Region) -> LocationsViewController {
        switch architecture {
        case .mvvm:
            let view = MVVMLocationsViewController()
            view.region = region
            return view
        case .redux:
            let view = ReduxLocationsViewController()
            view.region = region
            view.apiActions = APIActions(httpClient: httpClient(),
                                         store: store())
            view.store = store()
            view.navigator = navigator()
            return view
        }
    }
    
    func locationDetailViewController(location: Location) -> LocationDetailViewController {
        switch architecture {
        case .mvvm:
            let view = MVVMLocationDetailViewController()
            view.location = location
            return view
        case .redux:
            let view = ReduxLocationDetailViewController()
            view.location = location
            return view
        }
    }
    
    func machinesViewController() -> MachinesViewController {
        switch architecture {
        case .mvvm:
            return MVVMMachinesViewController()
        case .redux:
            let view = ReduxMachinesViewController()
            view.store = store()
            return view
        }
    }
    
    func stateVisualizerViewController() -> StateVisualizerViewController {
        switch architecture {
        case .mvvm:
            let view = MVVMStateVisualizerViewController()
            view.architectureSwitcher = architectureSwitcher
            return view
        case .redux:
            let view = ReduxStateVisualizerViewController()
            view.architectureSwitcher = architectureSwitcher
            view.store = store()
            return view
        }
    }
    
}
