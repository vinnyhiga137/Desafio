//
//  MonthlyViewController.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 29/12/20.
//

import UIKit

class MonthlyViewController: UIViewController {
    
    // Local attributes
    let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    // Loading the views manually
    override func loadView() {
        super.loadView()
        self.addTableView()
    }
    
    
    /// Configures the initial state for the table view.
    /// The anchors (constraints), delegate, datasource, size are set here.
    private func addTableView() {
        
        // Adding table view into the main view, also setting it constraints
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        
        // Setting up delegate, datasource and the customized cell
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "DataViewCell")
        self.tableView.rowHeight = 80.0
        
        
        // Binding viewmodel and loading data
//        self.homeViewModel.updateTableViewData = {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
    }
    
}
