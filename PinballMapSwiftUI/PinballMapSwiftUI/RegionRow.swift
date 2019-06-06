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
        Text("\(region.fullName)")
    }
}

#if DEBUG
struct RegionRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RegionRow(region: regionsData.alphabetized[0])
            RegionRow(region: regionsData.alphabetized[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
