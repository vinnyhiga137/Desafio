//
//  DataViewCell.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import UIKit

class DataViewCell: UITableViewCell {
    
    // Local attributes
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
    
    /// Setups the respectively Xib file to this class.
    /// The xib will show the most important data related to the credit launches.
    private func setup() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DataViewCell", bundle: bundle)
        let viewOfCell = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        self.addSubview(viewOfCell)
        
    }
}
