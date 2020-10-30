//
//  CoreDataHelper.swift
//  ToDoList
//
//  Created by admin on 30.10.2020.
//

import Foundation
import CoreData
import DBHelper

class CoreDataHelper: DBHelperProtocol {
    typealias ObjectType = NSManagedObject
    typealias PredicateType = NSPredicate
    
    static let shared = CoreDataHelper()
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    // MARK: - DBHelperProtocol
    func create(_ object: NSManagedObject) {
        do {
            try context.save()
        } catch {
            fatalError("error saving context while creating an objecdt")
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, limit: Int? = nil) -> Result<[T], Error> {
        let request = objectType.fetchRequest()
        request.predicate = predicate
        if let limit = limit {
            request.fetchLimit = limit
        }
        do {
            let result = try context.fetch(request)
            return .success(result as? [T] ?? [])
        } catch {
            return .failure(error)
        }
    }
    
    func fetchFirst<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?) -> Result<T?, Error> {
        let result = fetch(objectType, predicate: predicate, limit: 1)
        switch result {
        case .success(let todos):
            return .success(todos.first as? T)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func update(_ object: NSManagedObject) {
        do {
            try context.save()
        } catch {
            fatalError("error saving context while updating an object")
        }
    }
    
    func delete(_ object: NSManagedObject) {
        
    }
    
    // MARK: - Core Data
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
