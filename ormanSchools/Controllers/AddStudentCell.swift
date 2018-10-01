//
//  AddStudentCell.swift
//  ormanSchools
//
//  Created by zoza on 18/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class AddStudentCell: UITableViewCell {

    @IBOutlet weak var studentTitle: UILabel!
    
    @IBOutlet weak var txtFieldTitle: MainTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
