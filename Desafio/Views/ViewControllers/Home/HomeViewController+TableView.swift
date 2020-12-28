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
        return Calendar.current.monthSymbols[section].uppercased()
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        let month = Calendar.current.monthSymbols[section].lowercased()
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        let value = formatter.string(from: NSNumber(value: self.homeViewModel.balance(in: Months(rawValue: month)!)))
        
        return "Montante desse mês: \(value!)"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let month = Calendar.current.monthSymbols[section].lowercased()
        return self.homeViewModel.creditLaunches[Months(rawValue: month)!]!.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = DetailsViewController()
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DataViewCell", for: indexPath) as! DataViewCell
        
        // Setting up the values for each cell about the credit launches
        let month = Calendar.current.monthSymbols[indexPath.section].lowercased()
        
        // Checking if the current index path index exists
        if indexPath.item < self.homeViewModel.creditLaunches[Months(rawValue: month)!]!.count {
            
            if let creditLaunch = self.homeViewModel.creditLaunches[Months(rawValue: month)!]?[indexPath.item] {
        
                // Populating the cell
                let formatter = NumberFormatter()
                formatter.usesGroupingSeparator = true
                formatter.numberStyle = .currency
                formatter.locale = Locale.current

                cell.name?.text = creditLaunch.origem
                cell.month?.text = month.uppercased()
                cell.value?.text = formatter.string(from: NSNumber(value: creditLaunch.valor))
                
            }
        }
        
        return cell
    }
    
}
