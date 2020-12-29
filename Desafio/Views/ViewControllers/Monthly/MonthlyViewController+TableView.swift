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
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DataViewCell", for: indexPath) as! DataViewCell

        return cell
    }
    
    
}
