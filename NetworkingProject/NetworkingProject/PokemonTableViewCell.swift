//
//  PokemonTableViewCell.swift
//  NetworkingProject
//
//  Created by Osagie Obaze on 12/9/20.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    
    func configure(with pokemon: Pokemon){
        self.pokemonNameLabel.text = pokemon.name.capitalized
        NetworkingManager.shared.getImageData(from: pokemon.frontImageURL) { (data, error) in
            guard let data = data else {return}
            DispatchQueue.main.async {
              self.pokemonImageView.image = UIImage(data: data)
            }        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
    
}
