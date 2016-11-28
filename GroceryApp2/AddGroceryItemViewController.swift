//
//  AddGroceryItemViewController.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import UIKit

class addGroceryItemViewController: UIViewController {
    
    @IBOutlet var itemNameField: UITextField?
    @IBOutlet var itemCountField: UITextField?
    
    let manager = DataManager.shared
    
    @IBAction func add() {
        try? manager.create(data: (name: itemNameField?.text, count: Int16((itemCountField?.text)!)!))
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func cancel() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
