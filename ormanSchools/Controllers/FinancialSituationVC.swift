//
//  FinancialSituationVC.swift
//  ormanSchools
//
//  Created by zoza on 30/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class FinancialSituationVC: BaseSideTableVC {

    var financeArray : [Finance] = []
    var stuId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

       
    }

    
    func loadData(){
        startAnimating()
        API.init().getStudentFinancial(studId: stuId!)
        { (done, finance) in
            if done {
                self.financeArray = finance
                self.stopAnimating()
                self.tableView.reloadData()
            }
            else{ self.stopAnimating()}
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return financeArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinancialCell", for: indexPath) as! FinancialCell
        cell.titleLbl.text = financeArray[indexPath.row].title ?? ""
        cell.totLbl.text = String(describing: financeArray[indexPath.row].total ?? 0)
        cell.paidLbl.text = String(describing:financeArray[indexPath.row].paid ?? 0)
        cell.discLbl.text = String(describing:financeArray[indexPath.row].discount ?? 0)
        cell.remLab.text = financeArray[indexPath.row].remain ?? ""
        return cell
    }
    
}
