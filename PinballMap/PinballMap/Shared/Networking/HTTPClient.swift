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
        let resource = PinballMapHTTPResource<RegionList>(
            method: .GET,
            path: "/regions.json"
        )
        hottPotato.sendRequest(for: resource) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completion(result)
            }
        }
    }
    
    func getLocations(inRegion region: Region, completion: @escaping (Result<LocationList, HottPotatoError>) -> ()) {
        let resource = PinballMapHTTPResource<LocationList>(
            method: .GET,
            path: "/region/\(region.name)/locations.json"
        )
        hottPotato.sendRequest(for: resource) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completion(result)
            }
        }
    }
    
}
