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
        List(mockRegionList.alphabetized) { region in
            RegionRow(region: region)
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
