//
//  AddGroceryListViewController.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import UIKit

class addGroceryListViewController: UIViewController {
    @IBOutlet var nameField: UITextField?
    
    let manager = DataManager.shared
    
    @IBAction func add() {
        try? manager.create(GroceryListNamed: nameField?.text)
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func cancel() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
