//
//  ContentView.swift
//  PinballMapSwiftUI3
//
//  Created by Harlan Kellaway on 6/6/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @EnvironmentObject var state: SwiftUIState
    
    var regionName: String {
        return (state.value.selectedRegion == nil)
        ? "N/A"
        : state.value.selectedRegion!.fullName
    }
    
    var body: some View {
        Text("Selected Region: \(regionName)")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
