//
//  CreditLaunch.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

class CreditLaunch: Codable {
    
    // Local attributes
    var id: Int
    var valor: Float
    var origem: String
    var categoria: Int
    var mes_lancamento: Int
    
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
