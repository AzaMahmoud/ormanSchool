//
//  SideMenuCell.swift
//  ormanSchools
//
//  Created by zoza on 17/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var titleMenu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
