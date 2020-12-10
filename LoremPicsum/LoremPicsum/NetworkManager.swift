//
//  NetworkManager.swift
//  LoremPicsum
//
//  Created by Osagie Obaze on 12/9/20.
//

import Foundation

enum NetworkError: Error{
    case invalidURLString
    case badData
}

final class NetworkingManager{ //singleton class for Network management
    
    static let shared = NetworkingManager()
    
    
    private init(){ //private initializer so that nothing else can inherit the class or make an instance of NetworkManager
        
    }
    
    func getDecodedObject<T: Decodable>(from urlString: String, completion: @escaping (T?, Error?) -> Void ){
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.invalidURLString)
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
              completion(nil, error)
                return
                
            }
//            guard let pokemon = try? JSONDecoder().decode(T.self, from: data) else{
//                completion(nil, NetworkError.badData)
//                return
//            completion(pokemon, nil)
//            }
            
            do{
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(decodedObject, nil)
            }catch{
                completion(nil, error)
            }

        }.resume()
    
    }
    func getImageData(from url: URL, completion:@escaping (Data?, Error?) -> Void){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data,error)
        }.resume()
    }
    
}
