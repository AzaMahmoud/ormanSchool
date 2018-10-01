//
//  ChildsTableViewController.swift
//  ormanSchools
//
//  Created by Mostafa on 9/24/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit


class ChildsTableViewController: BaseSideTableVC {

    var parentStuentArry: [Students] = []
    var typefrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupUI()
        loadData()
        print(UserStore.loadUser()?.parentId ?? 0)
    }
    
//    func setupUI(){
//      //  title = "Childerns"
//        menuButton()
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        self.revealViewController().rearViewRevealWidth = 300
//        self.revealViewController().rearViewRevealDisplacement = 50
//        self.revealViewController().toggleAnimationDuration = 0.5
//        self.revealViewController().toggleAnimationType = .spring
//        self.revealViewController().frontViewShadowColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
//
//    }
    
//    func menuButton(){
//        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu") , style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(animated:)))
//        self.navigationItem.setLeftBarButton(barButton, animated: true)
//    }
   // getParentStudents
    
    func loadData(){
        startAnimating()
        API.init().getStudent(parentId: UserStore.loadUser()?.parentId ?? 0)
        {(done ,childs) in
            if done {
                self.parentStuentArry = childs
                self.stopAnimating()
                self.tableView.reloadData()
            }else{
                self.stopAnimating()
            }
            
        }

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parentStuentArry.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childCell", for: indexPath) as! ChildCell
        cell.childName.text = parentStuentArry[indexPath.row].StudentName ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (typefrom == "HomeWork"){
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MaterialViewController") as! MaterialViewController
        viewController.students = parentStuentArry[indexPath.row]
        let nav = SchoolNavController(rootViewController: viewController)
        self.revealViewController().pushFrontViewController(nav, animated: true)
    }
        else if (typefrom == "Financial Situation"){
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FinancialSituationVC") as! FinancialSituationVC
            let nav = SchoolNavController(rootViewController: viewController)
            self.revealViewController().pushFrontViewController(nav, animated: true)
        }
    }
    
}
