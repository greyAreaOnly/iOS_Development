//
//  Pokemon.swift
//  NetworkingProject
//
//  Created by Osagie Obaze on 12/9/20.
//

import Foundation


struct Pokemon: Decodable{
    let name: String
    let frontImageURL: URL
    let types:[Types]

    
    
    enum CodingKeys: String, CodingKey{
        case name
        case sprites
        case types
    }
    
    enum spriteCodingKeys: String, CodingKey{
        case front = "front_default"
    }
    
 
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let spritesContainer = try container.nestedContainer(keyedBy: spriteCodingKeys.self, forKey: .sprites)
//
        
        self.name = try container.decode(String.self, forKey: .name)
        self.frontImageURL = try spritesContainer.decode(URL.self, forKey: .front)
        self.types = try container.decode([Types].self, forKey: .types)

    }
}


struct Types: Decodable{
    let typeName: String?

    enum CodingKeys: String, CodingKey{
        case type
    }

    enum TypeCodingKeys: String, CodingKey{
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let baseLevelContainer = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try baseLevelContainer.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)

        self.typeName = try typeContainer.decode(String.self, forKey: .name)
    }
//
}
