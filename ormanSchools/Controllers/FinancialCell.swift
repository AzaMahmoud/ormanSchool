//
//  FinancialCell.swift
//  ormanSchools
//
//  Created by zoza on 29/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class FinancialCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var totLbl: UILabel!
    @IBOutlet weak var paidLbl: UILabel!
    @IBOutlet weak var discLbl: UILabel!
    @IBOutlet weak var remLab: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
