//
//  ViewController.swift
//  TableTutorial
//
//  Created by Osagie Obaze on 12/3/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDoListTableView: UITableView!
    
    private let texts = ["Hello", "Goodbye", "Later"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
extension 

