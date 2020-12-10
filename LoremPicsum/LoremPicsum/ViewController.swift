//
//  ViewController.swift
//  LoremPicsum
//
//  Created by Osagie Obaze on 12/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picsumTableView: UITableView!
    var picsumArray:[Picsum] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getTenPicsum()
    }
    
    private func getTenPicsum(){
        
        self.picsumTableView.register(UINib(nibName: "PicsumTableViewCell", bundle: nil), forCellReuseIdentifier: "PicsumTableViewCell")
        self.picsumTableView.dataSource = self
        let group = DispatchGroup()
        
        for _ in 1...10{
            group.enter()
            NetworkingManager.shared.getDecodedObject(from: self.createRandomPicsumURL()) { (picsum: Picsum?, error) in
                guard let picsum = picsum else{return}
                self.picsumArray.append(picsum)
                group.leave()
            }
        }
        group.notify(queue: .main){
        self.picsumTableView.reloadData()
        }
    }

    
    private func createRandomPicsumURL() -> String{
        let randomNumber = Int.random(in: 1...100)
        return "https://picsum.photos/id/\(randomNumber)/info"
    }
    
    private func generateAlert(from error: Error) -> UIAlertController{
        let alert = UIAlertController(title: "Error", message: "We ran into an error! Error Description: \(error.localizedDescription)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        return alert
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.picsumArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PicsumTableViewCell", for: indexPath) as! PicsumTableViewCell
        cell.configure(with: self.picsumArray[indexPath.row])
        return cell
    }

}

