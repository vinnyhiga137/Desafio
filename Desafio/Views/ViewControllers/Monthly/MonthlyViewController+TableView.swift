//
//  MonthlyViewController+TableView.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 29/12/20.
//

import UIKit

extension MonthlyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.creditsVM.getCertainCreditLaunches(in: Months(rawValue: self.selectedMonthIndex)!).count
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let value = self.creditsVM.balance(in: Months(rawValue: self.selectedMonthIndex)!).convertToReal()
        return "Montante desse mês: \(value)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Finding the respectively credit launch
        let detailsVC = DetailsViewController()
        
        detailsVC.creditLaunch = self.creditsVM.creditLaunches[Months(rawValue: self.selectedMonthIndex)!]![indexPath.item]
        
        // Finding the correct category
        for category in self.creditsVM.categories where category.id == detailsVC.creditLaunch?.categoria {
            
            detailsVC.category = category
            break
            
        }
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DataViewCell", for: indexPath) as! DataViewCell

        // Setting up the values for each cell about the credit launches
        let month = Months(rawValue: indexPath.section)!.description.lowercased()
        
        if let creditLaunch = self.creditsVM.creditLaunches[Months(rawValue: self.selectedMonthIndex)!]?[indexPath.item] {
    
            // Populating the cell
            cell.name?.text = creditLaunch.origem
            cell.month?.text = month.uppercased()
            cell.value?.text = creditLaunch.valor.convertToReal()
            
        }
        
        return cell
    }
    
    
}
