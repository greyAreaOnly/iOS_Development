//
//  ApiRepository.swift
//  CoreDataProject
//
//  Created by Osagie Obaze on 12/29/20.
//

import Foundation

class ApiRepository {
    
    private init() {}
    static let shared = ApiRepository()
    
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://assets.shpock.com/mobile/interview-test/")!
    
    func getShips(completion: @escaping(_ shipsDict: [[String: Any]]?, _ error: Error?) -> ()) {
        let shipURL = baseURL.appendingPathComponent("pirateships")
        urlSession.dataTask(with: shipURL) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: dataErrorDomain, code: DataErrorCode.networkUnavailable.rawValue, userInfo: nil)

                completion(nil, error)
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonDictionary = jsonObject as? [String: Any], let result = jsonDictionary["ships"] as? [[String: Any]] else {
                    throw NSError(domain: dataErrorDomain, code: DataErrorCode.wrongDataFormat.rawValue, userInfo: nil)
                }
                completion(result, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
