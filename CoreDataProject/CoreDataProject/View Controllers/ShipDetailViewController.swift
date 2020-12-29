//
//  ShipDetailViewController.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/28/20.
//

import UIKit

class ShipDetailViewController: UIViewController {
    
    var ship: Ship?

    
    @IBOutlet weak var shipIdLabel: UILabel!
    @IBOutlet weak var shipTitleLabel: UILabel!
    @IBOutlet weak var shipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shipIdLabel.text = String(ship?.id ?? 0)
        self.shipTitleLabel.text = ship?.title
        self.shipLabel.text = ship?.description //ship title label


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
