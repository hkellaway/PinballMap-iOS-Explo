//
//  Store.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

final class MyStore: Store<State> {
    
    static var shared = MyStore()
    
    convenience init(appReducer: AppReducer = AppReducer.shared) {
        self.init(reducer: appReducer.execute, state: nil)
    }
    
    required init(reducer: @escaping Reducer<State>, state: State?, middleware: [Middleware<State>] = [], automaticallySkipsRepeats: Bool = true) {
        super.init(reducer: reducer, state: state, middleware: middleware, automaticallySkipsRepeats: automaticallySkipsRepeats)
    }
    
}
