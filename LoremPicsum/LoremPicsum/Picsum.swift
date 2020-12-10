//
//  Picsum.swift
//  LoremPicsum
//
//  Created by Osagie Obaze on 12/9/20.
//

import Foundation

struct Picsum: Decodable{
    let id: String
    let downloadURL: URL
    
    enum CodingKeys: String, CodingKey{
        case id
        case downloadURL = "download_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.downloadURL = try container.decode(URL.self, forKey: .downloadURL)
    }
}
