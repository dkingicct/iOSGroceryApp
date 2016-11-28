//
//  GroceryItem+CoreDataProperties.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import Foundation
import CoreData

extension GroceryItem {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryItem> {
        return NSFetchRequest<GroceryItem>(entityName: "GroceryItem")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var count: Int16
    @NSManaged public var list: GroceryList?
}
