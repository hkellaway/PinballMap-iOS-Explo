//
//  HTTPClient.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import HottPotato

final class HTTPClient {
    
    static var shared = HTTPClient()
    
    private let hottPotato: HottPotato
    
    init(hottPotato: HottPotato = HottPotato.shared) {
        hottPotato.keyDecodingStrategy = .convertFromSnakeCase
        self.hottPotato = hottPotato
    }
    
    func getRegions(completion: @escaping (Result<RegionList, HottPotatoError>) -> ()) {
        let regionList = PinballMapHTTPResource<RegionList>(
            method: .GET,
            path: "/regions.json"
        )
        hottPotato.sendRequest(for: regionList, completion: completion)
    }
    
}
