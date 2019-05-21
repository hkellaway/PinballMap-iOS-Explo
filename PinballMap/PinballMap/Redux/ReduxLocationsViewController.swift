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
    var navigator: Navigator!
    
    private var locations: [Location] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        store.dispatch(apiActions.fetchLocations)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        self.locations = state.locationList?.alphabetized ?? []
        tableView.reloadData()
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension ReduxLocationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let location = locations[indexPath.row]
        cell.textLabel?.text = location.name
        return cell
    }
    
}
