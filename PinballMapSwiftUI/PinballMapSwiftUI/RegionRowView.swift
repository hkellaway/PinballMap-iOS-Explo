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
    let isSelected: Bool
    
    var body: some View {
        Text("\(region.fullName)")
            .color(self.isSelected ? Color.red : Color.black)
    }
}

#if DEBUG
struct RegionRowView_Previews : PreviewProvider {
    static var previews: some View {
        let mockRegion = Region(id: 1, name: "nyc", fullName: "New York City")
        
        return Group {
            RegionRowView(region: mockRegion, isSelected: false)
           RegionRowView(region: mockRegion, isSelected: true)
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
