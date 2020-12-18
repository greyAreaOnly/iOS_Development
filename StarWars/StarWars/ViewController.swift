//
//  ViewController.swift
//  StarWars
//
//  Created by Osagie Obaze on 12/18/20.
//

import UIKit

class ViewController: UIViewController {
    var StarWarsArray: [Results] = []
    var nextPageUrl:String = ""

    @IBOutlet weak var StarWarsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.StarWarsTableView.register(UINib(nibName: "StarWarsTableViewCell", bundle: nil), forCellReuseIdentifier: "StarWarsTableViewCell")
        self.StarWarsTableView.dataSource = self
        self.getInitialStarWarsData()
        self.getAllStarWars()
    
    }
    
    
    func getInitialStarWarsData(){
        StarWarsArray = []
        //first page is next page
        nextPageUrl = "https://swapi.dev/api/people/?offset=0&limit=30"
        getStarWarsData()

    }
    
    private func createStarWarsURL() -> String{
        return"https://swapi.dev/api/people/"
    }
    

    
    func getStarWarsData(){
        guard let urlObj = URL(string: nextPageUrl) else { return }

        URLSession.shared.dataTask(with: urlObj) {[weak self](data, response, error) in
            guard let data = data else {return}

            do {
                   //decode object
                   let downloadedStarWars = try JSONDecoder().decode(StarWars.self, from: data)
                self?.StarWarsArray.append(contentsOf: downloadedStarWars.results)
                self?.nextPageUrl = downloadedStarWars.next

                   DispatchQueue.main.async {
                       self?.StarWarsTableView.reloadData()
                   }
                   print(self?.StarWarsArray as Any)

               } catch {
                   print(error)

               }

               }.resume()
    }
    
    private func getAllStarWars() {
          let group = DispatchGroup()
          for i in 1...10 {
              group.enter()
              let iString = "\(i)"
              NetworkingManager.shared.getDecodedObject(from: self.createStarWarsURL() + iString) {
                  (starWars: Results?, error) in
                  guard let starWars = starWars else {return}
                  self.StarWarsArray.append(starWars)
                  group.leave()
              }
          }
          group.notify(queue: .main) {
              self.StarWarsTableView.reloadData()
          }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterViewController {
            destination.starWars = StarWarsArray[StarWarsTableView.indexPathForSelectedRow!.row]
        }
    }
    
    
}




extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.StarWarsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarWarsTableViewCell", for: indexPath) as! StarWarsTableViewCell
        cell.configure(with: self.StarWarsArray[indexPath.row])
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "ShowCharacter", sender: self)
    }
}

