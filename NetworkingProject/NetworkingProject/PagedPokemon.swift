//
//  PagedPokemon.swift
//  NetworkingProject
//
//  Created by Osagie Obaze on 12/16/20.
//

import Foundation

import UIKit
struct PagedPokemon: Decodable {
    let next: String
    let results: [Results]
    
    enum CodingKeys: String, CodingKey{
        case next
        case results
    }

}


struct Results: Decodable {
    let name: String
    let url: String
    
    enum ResultCodingKeys: String, CodingKey{
        case name
        case url
    }
    
    init(from decoder: Decoder) throws {
        let baseContainer = try decoder.container(keyedBy: ResultCodingKeys.self)
        self.name = try baseContainer.decode(String.self, forKey: .name)
        self.url = try baseContainer.decode(String.self, forKey: .url)
        
    }

}
