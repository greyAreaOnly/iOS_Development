//
//  ShipEntity.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/29/20.
//

import Foundation
import CoreData

class ShipEntity: NSManagedObject{
    @NSManaged var id: NSNumber
    @NSManaged var title: String
    @NSManaged var shipDescription: String
    
    func update(with jsonDictionary: [String:Any]) throws{
        guard let id = jsonDictionary["id"] as? Int,
            let title = jsonDictionary["title"] as? String,
            let shipDescription = jsonDictionary["description"] as? String
            else{
                throw NSError(domain: "", code: 100, userInfo: nil)
            }
        
        self.id = NSNumber(value: id)
        self.title = title
        self.shipDescription = shipDescription
    }
    
    
}
