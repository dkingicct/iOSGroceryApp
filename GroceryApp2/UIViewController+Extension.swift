//
//  UIViewController+Extension.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    @IBAction func dimissKeyboard() {
        view.endEditing(true)
    }
}
