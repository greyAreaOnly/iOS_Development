//
//  DetailsViewController.swift
//  NetworkingProject
//
//  Created by Osagie Obaze on 12/14/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var pokemon :Pokemon?
    
    @IBOutlet weak var pokemonDetailsImageView: UIImageView!
    
    @IBOutlet weak var pokemonDetailsNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonDetailsNameLabel.text = pokemon?.name.capitalized
        NetworkingManager.shared.getImageData(from: pokemon!.frontImageURL) { (data, error) in
                   guard let data = data else {return}
                   DispatchQueue.main.async {
                       self.pokemonDetailsImageView.image = UIImage(data: data)
                   }
                   
               }
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
