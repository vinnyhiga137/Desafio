//
//  DetailsViewController.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .white
        
        self.addReceiptView()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    private func addReceiptView() {
        
        let receiptView = UIView()
        
        self.view.addSubview(receiptView)
        
        receiptView.translatesAutoresizingMaskIntoConstraints = false
        receiptView.backgroundColor = .systemBlue
        
        receiptView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        receiptView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        receiptView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        receiptView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
}
