//
//  PinballMapHTTPResource.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class PinballMapHTTPResource<T: Decodable>: HTTPResource<T> {
    
    init(method: HTTPResource<T>.Method, path: String) {
        super.init(method: method,
                   baseURL: "https://pinballmap.com/api/v1",
                   path: path)
    }
    
}
