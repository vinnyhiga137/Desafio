//
//  CategoryType.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

class CategoryType: NSObject, Codable {
 
    // Local attributes
    var id: Int
    var nome: String
    
    
    /// Initializes a category type object.
    /// - Parameters:
    ///   - id: Unique identifier of the category.
    ///   - nome: Name of the category.
    init(id: Int, nome: String) {
        self.id = id
        self.nome = nome
    }
    
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CategoryTypeKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.nome = try container.decode(String.self, forKey: .nome)
        
    }
    
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CategoryTypeKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.nome, forKey: .nome)
       
    }
    
}

// Coding Keys related to the coding protocol for category type
fileprivate enum CategoryTypeKeys: String, CodingKey {
    case id
    case nome
}
