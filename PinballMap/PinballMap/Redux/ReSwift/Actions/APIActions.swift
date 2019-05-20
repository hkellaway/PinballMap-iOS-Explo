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
    let store: Store<State>
    
    init(httpClient: HTTPClient, store: Store<State>) {
        self.httpClient = httpClient
        self.store = store
    }
    
    func fetchRegions(state: State, store: Store<State>) -> Action? {
        httpClient.getRegions { [weak self] result in
            switch result {
            case .success(let regionList):
                self?.store.dispatch(LoadRegions(regions: regionList))
            case .failure(let error):
                // TODO
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
