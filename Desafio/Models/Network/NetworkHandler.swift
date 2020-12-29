//
//  NetworkHandler.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

class NetworkHandler: NSObject {
    
    private static let MAIN_ENDPOINT = "https://desafio-it-server.herokuapp.com"
    
    /// Gets the credit launches from a year.
    /// - Parameter completion: A closure that returns a list of credit launches in a year.
    /// - Returns: A closure with it's value.
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
    
    
    /// Gets all available category types for each type of credit launches.
    /// - Parameter completion: A closure that returns a list of available categories.
    /// - Returns: A closure with it's value.
    static func getCategoryTypes(completion: @escaping ([CategoryType]) -> ()) {
        
        URLSession.shared.dataTask(with: URL(string: NetworkHandler.MAIN_ENDPOINT + "/categorias")!) {
            (data, response, error) in
            
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                let categoryTypes = try! jsonDecoder.decode([CategoryType].self, from: data)
                
                completion(categoryTypes)
                    
            }
            
        }.resume()
        
    }
    
}
