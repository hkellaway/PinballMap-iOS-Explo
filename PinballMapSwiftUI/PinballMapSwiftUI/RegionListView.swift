//
//  RegionListView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct RegionListView : View {
    var regionList: RegionList
    
    var body: some View {
        NavigationView {
            List(regionList.alphabetized) { region in
                NavigationButton(destination: LocationDetailView(location: nil)) {
                    RegionRow(region: region)
                }
            }
            .navigationBarTitle(Text("Regions"))
        }
    }
}

#if DEBUG
struct RegionListView_Previews : PreviewProvider {
    static var previews: some View {
        RegionListView(regionList: mockRegionList)
    }
}
#endif
