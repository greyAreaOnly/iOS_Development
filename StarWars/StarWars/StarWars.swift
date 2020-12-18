//
//  StarWars.swift
//  StarWars
//
//  Created by Osagie Obaze on 12/18/20.
//

import Foundation

struct StarWars: Decodable{
    
    let next: String
    let results: [Results]
    
    enum CodingKeys: String, CodingKey{
        case next
        case results
        
    }
    
}

struct Results: Decodable{
    let name: String
    let hairColor: String
    let eyeColor: String

    
    enum ResultsCodingKeys: String, CodingKey{
        case name
        case hairColor = "hair_color"
        case eyeColor = "eye_color"
    }
    
    init(from decoder: Decoder) throws {
        let baseContainer = try decoder.container(keyedBy: ResultsCodingKeys.self)
        self.name = try baseContainer.decode(String.self, forKey: .name)
        self.hairColor = try baseContainer.decode(String.self, forKey: .hairColor)
        self.eyeColor = try baseContainer.decode(String.self, forKey: .eyeColor)
        
    }
}
