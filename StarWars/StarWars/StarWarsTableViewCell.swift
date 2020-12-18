//
//  StarWarsTableViewCell.swift
//  StarWars
//
//  Created by Osagie Obaze on 12/18/20.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {
    @IBOutlet weak var StarWarsNameLabel: UILabel!
    @IBOutlet weak var StarWarsHairColorLabel: UILabel!
    
    @IBOutlet weak var StarWarsEyeColorLabel: UILabel!
    
    func configure(with starWars: Results){
        self.StarWarsNameLabel.text = "Name:\(starWars.name)"
        print (starWars.name)
        self.StarWarsHairColorLabel.text = "Hair Color: \(starWars.hairColor)"
        self.StarWarsEyeColorLabel.text = "Eye Color: \(starWars.eyeColor)"
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
