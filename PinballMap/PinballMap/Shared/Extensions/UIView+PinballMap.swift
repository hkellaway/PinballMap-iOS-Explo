//
//  UIView+PinballMap.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/21/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Shows activity indicator in view givne a theme.
    ///
    /// - Parameters:
    ///   - color: Activity indicator color.
    open func showActivityIndicator(color: UIColor = .black) {
        // Could have a more elegant solution than this, but thats not
        // the point of this demo!
        for view in subviews {
            if let _ = view as? UIActivityIndicatorView {
                return
            }
        }
        
        let indicator = UIActivityIndicatorView()
        
        indicator.color = color
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(indicator)
        bringSubviewToFront(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicator.startAnimating()
    }
    
    open func hideActivityIndicator() {
        for view in subviews {
            if let view = view as? UIActivityIndicatorView {
                view.stopAnimating()
                view.removeFromSuperview()
                break
            }
        }
    }
    
}
