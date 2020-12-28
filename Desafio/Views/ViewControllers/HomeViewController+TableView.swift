//
//  HomeViewController+TableView.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current

        return Calendar.current.monthSymbols[section].uppercased()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let month = Calendar.current.monthSymbols[section].lowercased()
        return self.homeViewModel.creditLaunches[month]!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DataViewCell", for: indexPath) as! DataViewCell
        
        // Setting up the values for each cell about the credit launches
        let month = Calendar.current.monthSymbols[indexPath.section].lowercased()
        
        if indexPath.item < self.homeViewModel.creditLaunches[month]!.count, let creditLaunch = self.homeViewModel.creditLaunches[month]?[indexPath.item] {
        
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.locale = Locale.current

            cell.name?.text = creditLaunch.origem
            cell.month?.text = month.uppercased()
            cell.value?.text = formatter.string(from: NSNumber(value: creditLaunch.valor))
            
        }
        
        cell.selectionStyle = .none
            
        
        return cell
    }
    
}
