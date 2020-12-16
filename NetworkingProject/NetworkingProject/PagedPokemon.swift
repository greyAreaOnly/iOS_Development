//
//  PagedPokemon.swift
//  NetworkingProject
//
//  Created by Osagie Obaze on 12/16/20.
//

import Foundation

import UIKit
struct PagedPokemon: Codable {
    let info: Info
    let results: [Results]

}
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}

struct Results: Codable {
    let name: String
}
