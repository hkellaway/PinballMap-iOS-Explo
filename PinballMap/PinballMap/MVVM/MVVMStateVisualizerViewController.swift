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
    
    override func architectureName() -> String {
        return "MVVM"
    }
    
    override func refresh() {
        let state = determineStateFromViewObjects()
        stateTextView.text = state.description
    }
    
    private func determineStateFromViewObjects() -> State {
        let rootTabBarController: RootTabBarController? = UIApplication.shared.delegate?.window??.rootViewController as? RootTabBarController
        let locationsNavController: UINavigationController? = rootTabBarController?.viewControllers?[0] as? UINavigationController
        let locationsViewController: MVVMLocationsViewController? = locationsNavController?.viewControllers[0] as? MVVMLocationsViewController
        let locationsViewModel: LocationsViewModel? = locationsViewController?.viewModel
        
        if let regions = locationsViewModel?.regions {
            return State(regionList: RegionList(regions: regions))
        } else {
            return State(regionList: nil)
        }
    }
    
}
