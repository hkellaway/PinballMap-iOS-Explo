//
//  RegionListView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct RegionListView : View {
    var body: some View {
        List {
            RegionRow(region: regionsData.alphabetized[0])
            RegionRow(region: regionsData.alphabetized[1])
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
