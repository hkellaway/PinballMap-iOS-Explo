//
//  ReduxLocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxLocationsViewController: LocationsViewController, StoreSubscriber {
    
    var apiActions: APIActions!
    var store: Store<State>!
    
    private var regions: [Region]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        store.dispatch(apiActions.fetchRegions)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        self.regions = state.regionList?.alphabetized
        tableView.reloadData()
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSources

extension ReduxLocationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let region = regions?[indexPath.row]
        cell.textLabel?.text = region?.fullName ?? "NO NAME"
        return cell
    }
    
}

