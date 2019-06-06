//
//  RegionRowView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/6/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct RegionRowView : View {
    
    let region: Region
    
    var body: some View {
        Text("\(region.fullName)")
    }
}

#if DEBUG
struct RegionRowView_Previews : PreviewProvider {
    static var previews: some View {
        let mockRegion = Region(id: 1, name: "nyc", fullName: "New York City")
        return RegionRowView(region: mockRegion)
    }
}
#endif
