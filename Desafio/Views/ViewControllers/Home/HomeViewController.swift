//
//  HomeViewController.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

class HomeViewController: UIViewController {

    // Local attributes
    let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    let homeViewModel = HomeViewModel()
    
    // Loading the views manually
    override func loadView() {
        super.loadView()
        self.addTableView()
    }
    
    // Setting up some minor changes into the navigation bar and other views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the home screen title
        self.navigationController?.navigationBar.topItem?.title = "Lançamentos"
        
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
        self.homeViewModel.updateTableViewData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }


}

