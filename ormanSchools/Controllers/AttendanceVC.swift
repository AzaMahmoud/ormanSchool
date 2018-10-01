//
//  AttendanceVC.swift
//  ormanSchools
//
//  Created by zoza on 29/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class AttendanceVC: BaseSideVC ,// UITableViewDataSource,
     UITableViewDelegate
{

    @IBOutlet weak var datFromOutlet: UIButton!
    
    @IBOutlet weak var datToOutlet: UIButton!
    @IBOutlet weak var detailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // detailTableView.dataSource = self
        detailTableView.delegate = self

    }
    @IBAction func datFrom(_ sender: UIButton) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                let date = formatter.string(from: dt)
                sender.setTitle(date, for: .normal)
                sender.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    
    @IBAction func datTo(_ sender: UIButton) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                let date = formatter.string(from: dt)
                sender.setTitle(date, for: .normal)
                sender.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    
    @IBAction func showBtnPrsd(_ sender: UIButton) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
