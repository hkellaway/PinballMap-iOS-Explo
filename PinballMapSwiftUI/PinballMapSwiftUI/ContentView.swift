//
//  ContentView.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello " + Region(id: 1, name: "region-1", fullName: "Region1").fullName)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
