//
//  hideKeyboard.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }
    
    func dismissKeyboard()
    {
        self.view.frame.origin.y = 0
        view.endEditing(true)
    }
}
