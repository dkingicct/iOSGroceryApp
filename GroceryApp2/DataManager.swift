//
//  DataManager.swift
//  GroceryApp2
//
//  Created by King, Daniel on 11/27/16.
//  Copyright © 2016 King, Daniel. All rights reserved.
//

import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class DataManager {
    static var shared: DataManager = DataManager()
    
    var managedObjectContext: NSManagedObjectContext?
    
    var groceryLists: [GroceryList]
    var groceryListsCount: Int {
        return groceryLists.count
    }
    
    var groceryItems: [GroceryItem]
    var groceryItemsCount: Int {
        return groceryItems.count
    }
    
    var selectedGroceryListsIndex: Int
    var selectedGroceryItemsIndex: Int
    
    private init() {
        groceryLists = []
        groceryItems = []
        selectedGroceryListsIndex = -1
        selectedGroceryItemsIndex = -1
    }
}

extension DataManager {
    func loadGroceryListsData() {
        groceryLists = fetch()
    }
    
    func create(GroceryListNamed name: String?) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryList", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        
        let obj = GroceryList(entity: entity, insertInto: ctx)
        obj.name = name
        
        try? save()
    }
    
    func getGroceryListName(from indexPath: IndexPath) -> String? {
        return groceryLists.value(at: indexPath.row)?.name
    }
}

extension DataManager {
    
    func loadMyData() {
        let selectedGroceryList = groceryLists.value(at: selectedGroceryListsIndex)
        groceryItems = selectedGroceryList?.items?.flatMap { item in
            return item as? GroceryItem
        } ?? []
    }
    
    func create(data: (name: String?, count: Int16)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryItem", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = GroceryItem(entity: entity, insertInto: ctx)
        obj.name = data.name
        obj.count = Int16(data.count)
        obj.list = groceryLists.value(at: selectedGroceryListsIndex)
        
        try? save()
    }
    
    func getGroceryItem(from indexPath: IndexPath) -> (name: String?, count: Int)? {
        guard let item = groceryItems.value(at: indexPath.row) else {
            return nil
        }
        return (item.name, Int(item.count))
    }
}

extension DataManager {
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeFetchRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
    
    private func executeFetchRequest<T: NSManagedObject>() throws -> [T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
