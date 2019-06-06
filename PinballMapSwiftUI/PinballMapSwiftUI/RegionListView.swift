//
//  RegionListView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

extension Region: Identifiable { }

struct RegionListView : View {
    var body: some View {
        NavigationView {
            List(mockRegionList.alphabetized) { region in
                NavigationButton(destination: LocationDetailView()) {
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
        RegionListView()
    }
}
#endif
