
//
//  NotifyCell.swift
//  ormanSchools
//
//  Created by Mostafa on 10/1/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class NotifyCell: UITableViewCell {

    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var notifyDes: UITextView!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ data: Notifications) {
        studentName.text = data.studentName ?? ""
        notifyDes.text = data.notificationDes ?? ""
        date.text = data.notificationDateTime ?? ""
    }

}
