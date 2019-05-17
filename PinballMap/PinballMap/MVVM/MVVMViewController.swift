//
//  MVVMViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

final class ViewModel {
    
    weak var view: MVVMViewController?
    
    func load() {
        view?.newBackgroundColor?(.red)
    }
    
}

final class MVVMViewController: ViewController {
    
    var viewModel: ViewModel!
    
    var newBackgroundColor: ((UIColor) -> ())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        viewModel.load()
    }
    
    private func setupBindings() {
        newBackgroundColor = { [weak self] value in
            self?.view.backgroundColor = value
        }
    }
    
}
