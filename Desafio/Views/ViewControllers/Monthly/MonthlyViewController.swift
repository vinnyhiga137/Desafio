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
    var creditsVM = CreditLaunchesViewModel()
    var selectedMonthIndex: Int = 0
    
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
    
    
    /// Adds the calendar header above the list of credit launches.
    /// The anchors (constraints), triggers and month's name are set here.
    private func addCalendarHeader() {
        
        // Creating the background of the receipt
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CalendarHeaderView", bundle: bundle)
        self.calendarHeaderView = nib.instantiate(withOwner: self, options: nil).first as? CalendarHeaderView

        self.view.addSubview(calendarHeaderView!)
        
        // Setting up constraints
        self.calendarHeaderView!.translatesAutoresizingMaskIntoConstraints = false
        
        self.calendarHeaderView!.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 8).isActive = true
        self.calendarHeaderView!.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.calendarHeaderView!.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        
        // Updating the month label
        self.calendarHeaderView?.name?.text = Months(rawValue: self.selectedMonthIndex)?.description.uppercased()
        
        self.calendarHeaderView?.backButton?.addTarget(self, action: #selector(self.changeToPreviousMonth), for: .touchDown)
        
        self.calendarHeaderView?.nextButton?.addTarget(self, action: #selector(self.changeToNextMonth), for: .touchDown)
        
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
        self.creditsVM.updateTableViewData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @objc
    private func changeToPreviousMonth() {
        
        if self.selectedMonthIndex == 0 {
            self.selectedMonthIndex = 11
        }
        else {
            self.selectedMonthIndex -= 1
        }
        
        self.calendarHeaderView?.name?.text = Months(rawValue: self.selectedMonthIndex)?.description.uppercased()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    @objc
    private func changeToNextMonth() {
        
        if self.selectedMonthIndex == 11 {
            self.selectedMonthIndex = 0
        }
        else {
            self.selectedMonthIndex += 1
        }
        
        self.calendarHeaderView?.name?.text = Months(rawValue: self.selectedMonthIndex)?.description.uppercased()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}
