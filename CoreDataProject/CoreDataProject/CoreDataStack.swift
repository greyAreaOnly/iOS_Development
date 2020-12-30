//
//  CoreDataStack.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/29/20.
//

import UIKit
import CoreData

class CoreDataStack {
    private init() {}
        static let shared = CoreDataStack()
        
        lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "CoreDataProject")
            
            container.loadPersistentStores(completionHandler: { (_, error) in
                guard let error = error as NSError? else { return }
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            })
            
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            container.viewContext.undoManager = nil
            container.viewContext.shouldDeleteInaccessibleFaults = true
            
            container.viewContext.automaticallyMergesChangesFromParent = true
            
            return container
        }()

}
