//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/27/20.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    
//MARK: - Variables
    var ships : [Ship] = [Ship]()
    var StarShips: [NSManagedObject] = []

//MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShipsTableViewCell")
        self.tableView.register(UINib(nibName: "ShipsTableViewCell", bundle: nil), forCellReuseIdentifier: "ShipsTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.getShipData()
    }
    
//MARK: - Target Actions

     func getShipData(){
             guard let url = URL(string: "https://assets.shpock.com/mobile/interview-test/pirateships") else {return}
             URLSession.shared.dataTask(with: url) { (data, response, error) in
                 guard let data = data else {return}
                 if let ship = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                     //print("Got the ships: \(ship["ships"] as? [Any])")
                     if let ships = ship["ships"] as? [Any] {
                         let filtered = ships.compactMap { one in
                             one as? [String:AnyObject]
                         }
                         filtered.forEach { one in
                             let ship = Ship(withData: one)
                             self.ships.append(ship)
                         }
                         print(self.ships[0])
                     }
                 }
             }.resume()
         }

}


//MARK: - Delegate Calls

extension FirstViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ships.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ShipsTableViewCell", for: indexPath) as! ShipsTableViewCell
        
        cell.configure(with: self.ships[indexPath.row])
        
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "shipDetailView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shipDetailView" {
            if let secondVC = segue.destination as? ShipDetailViewController {
                secondVC.ship = self.ships[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

