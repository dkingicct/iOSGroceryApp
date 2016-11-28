//
//  GroceryList+CoreDataProperties.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import Foundation
import CoreData

extension GroceryList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryList> {
        return NSFetchRequest<GroceryList>(entityName: "GroceryList")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?
}

extension GroceryList {
    
    @objc(addItemObject:)
    @NSManaged public func addToGroceryList(_ value: GroceryItem)
    
    @objc(removeItemObject:)
    @NSManaged public func removeFromGroceryList(_ value: GroceryItem)
    
    @objc(addItem:)
    @NSManaged public func addToGroceryList(_ value: NSSet)
    
    @objc(removeItem:)
    @NSManaged public func removeFromGroceryList(_ value: NSSet)
}
