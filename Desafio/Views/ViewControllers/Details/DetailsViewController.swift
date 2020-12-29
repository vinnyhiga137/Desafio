//
//  DetailsViewController.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // Local attributes
    var creditLaunch: CreditLaunch?
    var category: CategoryType?
    
    /// Loading the views manually.
    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .white
        
        self.addReceiptView()
        
    }
    
    /// Adds the receipt view into the top of the screen.
    /// The receipt will show the full details about certain credit launch!
    private func addReceiptView() {
        
        // Creating the background of the receipt
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ReceiptView", bundle: bundle)
        let receiptView = nib.instantiate(withOwner: self, options: nil).first as! ReceiptView

        self.view.addSubview(receiptView)
        
        receiptView.translatesAutoresizingMaskIntoConstraints = false
        
        receiptView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        receiptView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        receiptView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true

        
        if let creditLaunch = self.creditLaunch {

            // Setting up the labels
            receiptView.name?.text = creditLaunch.origem
            receiptView.month?.text = Months.allCases[creditLaunch.mes_lancamento - 1].description
            receiptView.value?.text = creditLaunch.valor.convertToReal()
            receiptView.category?.text = self.category?.nome
            
        }
        
    }
    
}
