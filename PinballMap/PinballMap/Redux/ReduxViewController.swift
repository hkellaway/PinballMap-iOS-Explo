//
//  ReduxViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxViewController: ViewController, StoreSubscriber {
    
    var store: Store<State>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.dispatch(SetBackgroundColor(color: .purple))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        view.backgroundColor = state.backgroundColor
    }
    
}
