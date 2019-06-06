//
//  RegionRow.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import SwiftUI


import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var selectedRegion: Region? = nil {
        didSet {
            didChange.send(self)
        }
    }
    
    var regionList: RegionList = mockRegionList {
        didSet {
            didChange.send(self)
        }
    }
    
    func isRegionSelected(_ region: Region) -> Bool {
        guard let selectedRegion = selectedRegion else {
            return false
        }
        return region == selectedRegion
    }
}

struct RegionRow : View {
    // MARK: Stored properties
    
    var region: Region
    var isSelected: Bool
    
    // MARK: Body
    
    var body: some View {
        Text("\(region.fullName)")
            .foregroundColor(self.isSelected ? .red : .black)
    }
}

#if DEBUG
struct RegionRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RegionRow(region: mockRegionList.alphabetized[0], isSelected: false)
            RegionRow(region: mockRegionList.alphabetized[1], isSelected: true)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
