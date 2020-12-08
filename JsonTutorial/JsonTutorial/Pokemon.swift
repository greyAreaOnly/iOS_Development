//
//  Pokemon.swift
//  JsonTutorial
//
//  Created by Osagie Obaze on 12/4/20.
//

//import Foundation
//
//struct Pokemon{
//    let name: String
//    let baseExperience: Int
//    let weight: Int
//    
//    init?(json: [String: Any]) {
//        guard let name = json["name"] as? String, let exp = json["base_experience"]  as? Int, let weight = json["weight"] as? Int else{return nil}
//        self.name = name
//        self.baseExperience = exp
//        self.weight = weight
//    }
//}


struct CodablePokemon: Decodable{
    let name: String
    let baseExperience: Int
    let abilities:[Ability]
    let weight: Int
    let height: Int
    let species: [String:String]
    let sprites: [String:String?]//Sprites
    let moves: [Moves]

    
    enum CodingKeys: String, CodingKey{
        case name  // dont need to specify the difference in names
        case baseExperience = "base_experience"
        case abilities = "abilities"
        case weight = "weight"
        case height = "height"
        case species = "species"
        case sprites = "sprites"
        case moves = "moves"
    }
}

struct Ability: Decodable{
    let isHidden: Bool
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case isHidden = "is_hidden"
        case ability
    }
    
    enum AbilityCodingKeys: String, CodingKey{
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
        
        self.isHidden = try container.decode(Bool.self, forKey:.isHidden)
        self.name = try abilityContainer.decode(String.self,forKey: .name)
    }
}

//struct Sprites: Decodable {
//
//    let backDefault: String?
//    let backFemale: String?
//    let backShiny: String?
//    let backShinyFemale: String?
//    let frontDefault: String?
//    let frontfemale: String?
//    let frontShiny: String?
//    let frontShinyFemale: String?
//
//    enum CodingKeys: String, CodingKey{
//        case backDefault = "back_default"
//        case backFemale = "back_female"
//        case backShiny = "back_shiny"
//        case backShinyFemale = "back_shiny_female"
//        case frontDefault = "front_default"
//        case frontfemale = "front_female"
//        case frontShiny = "front_shiny"
//        case frontShinyFemale = "front_shiny_female"
//
//    }
//}

struct Moves: Decodable{
    let name: String
    let url: String
///    let moveLearnedMethodName: String
//    let moveLearnedMethodUrl: String
    
    enum CodingKeys: String, CodingKey{
        case move
        case versionGroupDetails
    }
    
    enum MoveCodingKeys: String, CodingKey{
        case name
        case url
    }
    
//    enum VersionGroupDetailsKeys: String, CodingKey{
//        case levelLearned = "level_learned_at"
//    }
    
    init(from decoder: Decoder) throws {
        let baseLevelContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let moveContainer = try baseLevelContainer.nestedContainer(keyedBy: MoveCodingKeys.self, forKey: .move)
        
//        let versionGroupDetailsContainer = try baseLevelContainer.nestedContainer(keyedBy: VersionGroupDetailsKeys.self, forKey: .versionGroupDetails)
        
        self.name = try moveContainer.decode(String.self, forKey: .name)
        self.url = try moveContainer.decode(String.self, forKey: .url)
//        self.levelLearned = try? versionGroupDetailsContainer.decode(Int.self, forKey: .levelLearned)
    }
    
}





