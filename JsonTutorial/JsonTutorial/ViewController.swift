//
//  ViewController.swift
//  JsonTutorial
//
//  Created by Osagie Obaze on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.parseData()
        parseDataCodable()
    }

//    func parseData(){
//        guard let fileURL =  //switch to Guard
//            Bundle.main.url(forResource: "PokemonExample", withExtension: "json")
//        else{return}
//    
//        
//        guard let fileData = try? Data(contentsOf: fileURL)else{return}
//        print(fileData)
//        
//        guard let parsedJSON = try? JSONSerialization.jsonObject(with: fileData, options:[]) as? [String: Any] else{return}
//        
//        print(Pokemon(json: parsedJSON) as Any)
//    }

}

    func parseDataCodable(){
        guard let fileURL =  //switch to Guard
            Bundle.main.url(forResource: "PokemonExample", withExtension: "json")
        else{return}
    
        
        guard let fileData = try? Data(contentsOf: fileURL)else{return}
        print(fileData)
        
        let pokemon = try? JSONDecoder().decode(CodablePokemon.self, from: fileData)
        print(pokemon as Any)
        
    }
