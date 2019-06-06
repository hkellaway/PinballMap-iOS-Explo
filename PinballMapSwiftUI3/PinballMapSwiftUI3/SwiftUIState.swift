//
//  SwiftUIState.swift
//  PinballMapSwiftUI3
//
//  Created by Harlan Kellaway on 6/6/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Combine
import SwiftUI

class SwiftUIState: BindableObject {
    var value: State = State.empty {
        didSet {
            didChange.send(self)
        }
    }
    
    var didChange = PassthroughSubject<SwiftUIState, Never>()

}
