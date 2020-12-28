//
//  DetailsViewController.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var creditLaunch: CreditLaunch?
    var category: CategoryType?
    
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

            // Getting the value converted into local currency (in this case Reais)
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.locale = Locale.current
            
            let value = formatter.string(from: NSNumber(value: creditLaunch.valor))
            
            // Setting up the labels
            receiptView.name?.text = creditLaunch.origem
            receiptView.month?.text = Months.allCases[creditLaunch.mes_lancamento - 1].rawValue
            receiptView.value?.text = value
            receiptView.category?.text = self.category?.nome
            
        }
        
    }
    
}
