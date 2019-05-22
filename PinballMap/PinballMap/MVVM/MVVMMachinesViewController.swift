//
//  MVVMMachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class MVVMMachinesViewController: MachinesViewController {
    
    let viewModel: MachinesViewModel
    let notificationCenter: NotificationCenter! = .default
    let session: Session! = Session.shared
    let navigator: Navigator
    
    init(viewModel: MachinesViewModel, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(regionUpdated(notification:)),
                                       name: .regionUpdated,
                                       object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateTitle(withRegion: session.currentRegion)
    }
    
    deinit {
        notificationCenter.removeObserver(self,
                                          name: .regionUpdated,
                                          object: nil)
    }
    
    
    func didLoadMachines() {
        view.hideActivityIndicator()
        navigator.setTabBadge(tab: .machines,
                              value: viewModel.machines.count)
    }
    
    func errorOccurred(_ error: Error) {
        view.hideActivityIndicator()
        displayError(error)
    }
    
    @objc private func regionUpdated(notification: Notification) {
        guard let region = notification.object as? Region else {
            return
        }
        updateTitle(withRegion: region)
        navigator.setTabBadge(tab: .machines, value: 0)
        view.showActivityIndicator()
        viewModel.load(forRegion: region)
    }
    
}
