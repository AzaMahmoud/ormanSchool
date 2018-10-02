//
//  AllMaterialCell.swift
//  ormanSchools
//
//  Created by Mostafa on 10/2/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class AllMaterialCell: UITableViewCell {

    @IBOutlet weak var subjectName: UILabel!
    
    @IBOutlet weak var downloadButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
