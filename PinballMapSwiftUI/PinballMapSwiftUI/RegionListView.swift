//
//  RegionListView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/6/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct RegionListView : View {
    
    let regionList: RegionList
    
    var body: some View {
        NavigationView {
            List {
                ForEach(regionList.alphabetized) { region in
                    NavigationButton(destination: ContentView()) {
                        RegionRowView(region: region, isSelected: false)
                    }
                }
            }.navigationBarTitle(Text("Regions"))
        }
    }
}

#if DEBUG
struct RegionListView_Previews : PreviewProvider {
    static var previews: some View {
        let mockRegion = Region(id: 1, name: "nyc", fullName: "New York City")
        let mockRegion2 = Region(id: 2, name: "region-2", fullName: "Region2")
        let mockRegionList = RegionList(regions: [mockRegion, mockRegion2])
        
        return RegionListView(regionList: mockRegionList)
    }
}
#endif
