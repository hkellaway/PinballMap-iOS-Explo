//
//  LoadMachines.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

struct LoadMachines: Action {
    let machineList: APIResponseStatus<MachineList>?
}
