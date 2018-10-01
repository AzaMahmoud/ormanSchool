//
//  SubjectView.swift
//  ormanSchools
//
//  Created by Mostafa on 9/24/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit
import Popover

protocol subjects {
    func getSubject(_ name: String , _ id: Int)
}

class SubjectView: UIView , UITableViewDataSource , UITableViewDelegate {
    var subjects: [Subjects]?
    var popover: Popover?
    var subject: subjects?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialCell", bundle: nil), forCellReuseIdentifier: "materialCell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "materialCell") as! MaterialCell
        cell.subjectName.text = subjects![indexPath.row].subAname ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subject?.getSubject(subjects![indexPath.row].subAname ?? "", subjects![indexPath.row].subID ?? 0)
        self.popover?.dismiss()
    }
    
    
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}
