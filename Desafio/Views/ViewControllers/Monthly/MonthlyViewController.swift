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
    var calendarHeaderView: CalendarHeaderView?
    
    // Loading the views manually
    override func loadView() {
        super.loadView()
        self.addCalendarHeader()
        self.addTableView()
        
        self.view.backgroundColor = .white
    }
    
    
    override func viewDidLoad() {
        
        // Setting the home screen title
        self.navigationController?.navigationBar.topItem?.title = "Mensal"
        
    }
    
    
    private func addCalendarHeader() {
        
        // Creating the background of the receipt
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CalendarHeaderView", bundle: bundle)
        self.calendarHeaderView = nib.instantiate(withOwner: self, options: nil).first as? CalendarHeaderView

        self.view.addSubview(calendarHeaderView!)
        
        calendarHeaderView!.translatesAutoresizingMaskIntoConstraints = false
        
        calendarHeaderView!.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 8).isActive = true
        calendarHeaderView!.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        calendarHeaderView!.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
    }
    
    
    /// Configures the initial state for the table view.
    /// The anchors (constraints), delegate, datasource, size are set here.
    private func addTableView() {
        
        // Adding table view into the main view, also setting it constraints
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.topAnchor.constraint(equalTo: self.calendarHeaderView!.bottomAnchor)
            .isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            .isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.calendarHeaderView!.leftAnchor)
            .isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.calendarHeaderView!.rightAnchor)
            .isActive = true
        
        
        // Setting up delegate, datasource and the customized cell
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "DataViewCell")
        self.tableView.rowHeight = 80.0
        self.tableView.backgroundColor = .white
        
        
        // Binding viewmodel and loading data
//        self.homeViewModel.updateTableViewData = {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
    }
    
}
