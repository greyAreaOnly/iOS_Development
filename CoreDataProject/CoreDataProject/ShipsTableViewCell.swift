//
//  ShipsTableViewCell.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/27/20.
//

import UIKit

class ShipsTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    func configure(with ships: Ship){
        self.idLabel.text = "ID:\(ships.id)"
        self.titleLabel.text =  "Title: \(ships.title ?? "Unknown")"
        self.descriptionLabel.text = "Description: \(ships.description ?? "Unknown")"
         
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
