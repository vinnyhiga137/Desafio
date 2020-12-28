//
//  NetworkHandler.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

class NetworkHandler: NSObject {
    
    private static let MAIN_ENDPOINT = "https://desafio-it-server.herokuapp.com"
    
    static func getCreditLaunches(completion: @escaping ([CreditLaunch]) -> ()) {
        
        URLSession.shared.dataTask(with: URL(string: NetworkHandler.MAIN_ENDPOINT + "/lancamentos")!) {
            (data, response, error) in
            
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                let creditLaunches = try! jsonDecoder.decode([CreditLaunch].self, from: data)
                
                completion(creditLaunches)
                    
            }
            
            
        }.resume()
        
    }
    
}
