//
//  PicsumTableViewCell.swift
//  LoremPicsum
//
//  Created by Osagie Obaze on 12/10/20.
//

import UIKit

class PicsumTableViewCell: UITableViewCell {

    @IBOutlet weak var picsumImageView: UIImageView!
    @IBOutlet weak var picsumIdLabel: UILabel!
    
    func configure(with picsum: Picsum){
        self.picsumIdLabel.text = "ID: <\(picsum.id)>"
        NetworkingManager.shared.getImageData(from: picsum.downloadURL) { (data, error) in
            guard let data = data else {return}
            DispatchQueue.main.async {
              self.picsumImageView.image = UIImage(data: data)
            }
        }
    }
    
}
