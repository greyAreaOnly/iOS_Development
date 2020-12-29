//
//  SpaceShips+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/29/20.
//
//

import Foundation
import CoreData


extension SpaceShips {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpaceShips> {
        return NSFetchRequest<SpaceShips>(entityName: "SpaceShips")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?

}

extension SpaceShips : Identifiable {

}
