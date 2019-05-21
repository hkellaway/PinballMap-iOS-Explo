//
//  MVVMMachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMMachinesViewController: MachinesViewController {
    
    var notificationCenter: NotificationCenter! = .default
    var session: Session! = Session.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self,
                                       selector: #selector(regionUpdated(notification:)),
                                       name: .regionUpdated,
                                       object: nil)
        updateTitle(withRegion: session.currentRegion)
    }
    
    deinit {
        notificationCenter.removeObserver(self,
                                          name: .regionUpdated,
                                          object: nil)
    }
    
    @objc private func regionUpdated(notification: Notification) {
        updateTitle(withRegion: notification.object as? Region)
    }
    
}
