//
//  RegionListView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

// TODO: Update UserData when Region is selected

struct RegionListView : View {
    @EnvironmentObject var userData: UserData
    
    var regionList: RegionList
    
    var body: some View {
        NavigationView {
            List(regionList.alphabetized) { region in
                NavigationButton(destination: LocationDetailView(location: nil)) {
                    RegionRow(region: region,
                              isSelected: self.userData.isRegionSelected(region))
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
            .environmentObject(UserData())
    }
}
#endif
