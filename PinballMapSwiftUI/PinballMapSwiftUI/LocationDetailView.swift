//
//  LocationDetailView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct LocationDetailView : View {
    var location: Location?
    
    var body: some View {
        Text(location?.name ?? ":(")
            .navigationBarTitle(Text(location?.name ?? ":("), displayMode: .inline)
    }
}

#if DEBUG
struct LocationDetailView_Previews : PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: mockLocationList.alphabetized[0])
    }
}
#endif
