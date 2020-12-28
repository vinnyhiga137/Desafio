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
    private(set) var creditLaunches: [String : [CreditLaunch]] {
        didSet {
            self.updateTableViewData()
        }
    }
    
    override init() {
        
        self.creditLaunches = ["janeiro": [], "fevereiro": [], "março": [], "abril": [],
                               "maio": [], "junho": [], "julho": [], "agosto": [],
                               "setembro": [], "outubro": [], "novembro": [],
                               "dezembro": []]
        
        super.init()
        self.loadCreditLaunches()
        
    }
    
    private func loadCreditLaunches() {
        NetworkHandler.getCreditLaunches(completion: {
            data in
            
            var updatedCreditLaunches: [String : [CreditLaunch]] = ["janeiro": [], "fevereiro": [], "março": [], "abril": [], "maio": [], "junho": [], "julho": [], "agosto": [], "setembro": [], "outubro": [], "novembro": [], "dezembro": []]
            
            for content in data {
                
                let month = Calendar.current.monthSymbols[content.mes_lancamento - 1].lowercased()
                
                updatedCreditLaunches[month]!.append(content)
                
            }

            self.creditLaunches = updatedCreditLaunches
            
        })
    }
}
