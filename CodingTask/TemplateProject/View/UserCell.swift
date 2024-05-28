//
//  CurrencyCell.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    //weak var delegate: NavigateToDetailView?
    
    var user : User? {
        didSet {
            
            guard let user = user else {
                return
            }
            
            rateLabel?.text = user.title
            currencyLabel?.text = "\(user.id)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print(user?.title ??  "")
    }
    
}
