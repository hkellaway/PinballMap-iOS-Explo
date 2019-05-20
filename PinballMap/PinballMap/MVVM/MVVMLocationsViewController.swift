//
//  MVVMLocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMLocationsViewController: LocationsViewController {
    
    var viewModel: LocationsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.load()
    }
    
    func didLoadRegions(_ regions: [Region]) {
        print(regions.count)
    }
    
    func errorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
