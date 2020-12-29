//
//  CreditLaunch.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

class CreditLaunch: NSObject, Codable {
    
    // Local attributes
    var id: Int
    var valor: Float
    var origem: String
    var categoria: Int
    var mes_lancamento: Int
    
    
    /// Initializes a credit launch object.
    /// - Parameters:
    ///   - id: Unique identifier of the credit launch.
    ///   - valor: Value of the launch.
    ///   - origem: Origin's name.
    ///   - categoria: Category of the launch (e.g., 1 for transport, 2 for online shopping...).
    ///   - mes_lancamento: Month of launch.
    init(id: Int, valor: Float, origem: String, categoria: Int, mes_lancamento: Int) {
        self.id = id
        self.valor = valor
        self.origem = origem
        self.categoria = categoria
        self.mes_lancamento = mes_lancamento
    }
    
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CreditLaunchKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.valor = try container.decode(Float.self, forKey: .valor)
        self.origem = try container.decode(String.self, forKey: .origem)
        self.categoria = try container.decode(Int.self, forKey: .categoria)
        self.mes_lancamento = try container.decode(Int.self, forKey: .mes_lancamento)
        
    }
    
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CreditLaunchKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.valor, forKey: .valor)
        try container.encode(self.origem, forKey: .origem)
        try container.encode(self.categoria, forKey: .categoria)
        try container.encode(self.mes_lancamento, forKey: .mes_lancamento)
        
    }
    
}

// Coding Keys related to the coding protocol for credit launches
fileprivate enum CreditLaunchKeys: String, CodingKey {
    case id
    case valor
    case origem
    case categoria
    case mes_lancamento
}
