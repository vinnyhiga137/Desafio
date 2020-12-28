//
//  DataViewCell.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

class DataViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var month: UILabel?
    @IBOutlet weak var value: UILabel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    private func setup() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DataViewCell", bundle: bundle)
        let viewOfCell = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        self.addSubview(viewOfCell)
        
    }
}
