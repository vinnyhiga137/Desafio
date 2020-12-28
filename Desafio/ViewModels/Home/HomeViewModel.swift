//
//  HomeViewModel.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

class HomeViewModel: NSObject {
    
    // Local internal attributes
    var updateTableViewData: (() -> ()) = {}
    
    // Local private attributes
    private(set) var creditLaunches: [Months : [CreditLaunch]] {
        didSet {
            self.updateTableViewData()
        }
    }
    
    override init() {
        
        self.creditLaunches = [.january: [], .february: [], .march: [], .april: [],
                               .may: [], .june: [], .july: [], .august: [],
                               .september: [], .october: [], .november: [],
                               .december: []]
        
        super.init()
        self.loadCreditLaunches()
        
    }
    
    
    /// Gets the balance for a certain month.
    /// - Parameter month: Desired month to be checked
    /// - Returns: The balance in the desired month
    func balance(in month: Months) -> Float {
        
        var value: Float = 0.0
        
        if let launches = self.creditLaunches[month] {
            
            for content in launches {
                value += content.valor
            }
            
        }
        
        return value
    }
    
    
    /// Loads all credit launches in a year and organizes correctly by month.
    /// WARNING! This functions uses an async task inside of it, because we need to access the network to retrieve the data.
    private func loadCreditLaunches() {
        NetworkHandler.getCreditLaunches(completion: {
            data in
            
            var updatedCreditLaunches: [Months : [CreditLaunch]] = [.january: [], .february: [], .march: [], .april: [], .may: [], .june: [], .july: [], .august: [], .september: [], .october: [], .november: [], .december: []]
            
            for content in data {
                
                let month = Calendar.current.monthSymbols[content.mes_lancamento - 1].lowercased()
                updatedCreditLaunches[Months(rawValue: month)!]!.append(content)
                
            }

            self.creditLaunches = updatedCreditLaunches
            
        })
    }
}
