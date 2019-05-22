//
//  MVVMStateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMStateVisualizerViewController: StateVisualizerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        architectureTextField.text = "MVVM"
    }
    
    override func refresh() {
        let state = determineStateFromViewObjects()
        stateTextView.text = state.description
    }
    
    private func determineStateFromViewObjects() -> State {
        let rootTabBarController: RootTabBarController? = UIApplication.shared.delegate?.window??.rootViewController as? RootTabBarController
        
        // Get Regions from RegionsViewModel:
        
        let regionsNavController: UINavigationController? = rootTabBarController?.viewControllers?[0] as? UINavigationController
        let regionsViewController: MVVMRegionsViewController? = regionsNavController?.viewControllers[0] as? MVVMRegionsViewController
        let regionsViewModel: RegionsViewModel? = regionsViewController?.viewModel
        
        // Get Location from LocationsViewModel, if alive:
        
        let locationsViewController: MVVMLocationsViewController? =
            (regionsNavController?.viewControllers.count ?? 1) >= 2
                ? regionsNavController?.viewControllers[1] as? MVVMLocationsViewController
                : nil
        let locationsViewModel: LocationsViewModel? = locationsViewController?.viewModel
        
        // Get selectedRegion and selectedLocation from shared Session:
        
        let selectedRegion: Region? = Session.shared.currentRegion
        let selectedLocation: Location? = Session.shared.currenLocation
        
        // Convert to State obeject:
        
        let regionList: APIResponseStatus<RegionList>? = regionsViewModel?.regions == nil
            ? nil :
            .loaded(success: RegionList(regions: regionsViewModel!.regions))
        let locationList: APIResponseStatus<LocationList>? =
            locationsViewModel?.locations == nil
                ? nil
                : .loaded(success: LocationList(locations: locationsViewModel!.locations))
        
        return State(selectedRegion: selectedRegion,
                     selectedLocation: selectedLocation,
                     selectedMachine: nil,
                     regionList: regionList,
                     locationList: locationList,
                     machineList: nil)
    }
    
}
