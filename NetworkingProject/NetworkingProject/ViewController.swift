//
//  ViewController.swift
//  NetworkingProject
//
//  Created by Osagie Obaze on 12/8/20.
//

import UIKit

/*
 Getting API from URL automatically in JSON
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonImageView: UIImageView?
    @IBOutlet weak var pokemonNameLabel: UILabel?
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokemonArray: [Pokemon] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.getSingularPokemon()
        self.getOneFiftyPokemon()

    }
    
    private func getOneFiftyPokemon(){
        
        self.pokemonTableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonTableViewCell")
        self.pokemonTableView.dataSource = self
        let group = DispatchGroup()
        
        for _ in 1...150{
            group.enter()
            NetworkingManager.shared.getDecodedObject(from: self.createRandomPokemonURL()) { (pokemon: Pokemon?, error) in
                guard let pokemon = pokemon else{return}
                self.pokemonArray.append(pokemon)
                group.leave()
            }
        }
        group.notify(queue: .main){
        self.pokemonTableView.reloadData()
        }
    }
    
    private func getSingularPokemon(){
        NetworkingManager.shared.getDecodedObject(from: self.createRandomPokemonURL()) { (pokemon: Pokemon?, error) in
            guard let pokemon = pokemon else{
                if let error = error{
                    let alert = self.generateAlert(from: error)
                    DispatchQueue.main.async{
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                return
                
            }
            DispatchQueue.main.async {
                self.pokemonNameLabel?.text = pokemon.name
            }
            NetworkingManager.shared.getImageData(from: pokemon.frontImageURL) { (data, error) in
                guard let data = data else{return}
                DispatchQueue.main.async{
                    self.pokemonImageView?.image = UIImage(data: data)
                }
            }
        }
        
    }

    
    private func createRandomPokemonURL() -> String{
        let randomNumber = Int.random(in: 1...151)
        return "https://pokeapi.co/api/v2/pokemon/\(randomNumber)"
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
        return self.pokemonArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        cell.configure(with: self.pokemonArray[indexPath.row])
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "ShowDetailsView", sender: self)
    }
}


//*WIHTOUT NETWORK MANAGER CLASS
//        guard let url = URL(string: self.createRandomPokemonURL()) else {return}
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {return}
//            guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {return}
//
//            DispatchQueue.main.sync {
//                self.pokemonNameLabel.text = pokemon.name
//            }
//            URLSession.shared.dataTask(with: pokemon.frontImageURL) { (data, response, error) in
//                guard let data = data else{return}
//                let image = UIImage(data: data) //Take in data and gives a UI image
//
//                DispatchQueue.main.async {
//                    self.pokemonImageView.image = image
//                }
//            }.resume()
//        }.resume()
