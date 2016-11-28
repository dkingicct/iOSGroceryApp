//
//  GroceryListViewController.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import UIKit


class GroceryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var dataTableView: UITableView?
    
    let manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataTableView?.delegate = self
        dataTableView?.dataSource = self
        
        manager.loadGroceryListsData()
        dataTableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.groceryListsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        cell.textLabel?.text = manager.getGroceryListName(from: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedGroceryListsIndex = indexPath.row
    }
}
