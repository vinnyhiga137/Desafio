//
//  Float+Reais.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 29/12/20.
//

import Foundation

extension Float {
    
    /// Converts the current value into Brazilian Real (currency).
    /// - Returns: A string value in Brazilian Real
    func convertToReal() -> String {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        
        let value = formatter.string(from: NSNumber(value: self))!
        
        return value
    }
    
}
