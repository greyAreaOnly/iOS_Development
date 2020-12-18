//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Osagie Obaze on 12/18/20.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var starWars:Results?
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var charactereyeColorLabel: UILabel!
    @IBOutlet weak var characterHairColorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterNameLabel.text = starWars?.name.capitalized
        characterHairColorLabel.text = starWars?.hairColor
        charactereyeColorLabel.text = starWars?.eyeColor
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
