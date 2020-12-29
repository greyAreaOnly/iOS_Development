//
//  CodableShips.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/27/20.
//

import Foundation

struct Ship : Decodable {
    var id : Int = 0
    var title : String?
    var description: String?
//        var imagePath : String?
//
    init(withData data:[String:AnyObject]) {
        self.id = data["id"] as? Int ?? 0
        self.title = data["title"] as? String ?? "untitled"
        self.description = data["description"] as? String ?? "unknown"
//            self.imagePath = data["image"] as? String
    }
}
