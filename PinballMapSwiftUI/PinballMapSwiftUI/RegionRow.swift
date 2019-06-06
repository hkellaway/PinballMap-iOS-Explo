//
//  RegionRow.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct RegionRow : View {
    // MARK: Stored properties
    
    var region: Region
    
    // MARK: Body
    
    var body: some View {
        Text("Hello \(region.fullName)")
    }
}

#if DEBUG
struct RegionRow_Previews : PreviewProvider {
    static var previews: some View {
        RegionRow(region: regionsData.alphabetized[0])
    }
}
#endif
