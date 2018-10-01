//
//  SideMenuVC.swift
//  ormanSchools
//
//  Created by zoza on 17/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let menuTitle = ["Profile" , "Students" , "Financial Situation" , "Attendence" , "Academic Report" , "Homework" , "Notification" , "Logout"]
    let imageTitle = ["sideIcon" , "sideIcon" ,"sideIcon" , "sideIcon", "sideIcon" , "sideIcon" , "sideIcon", "sideIcon", "sideIcon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell") as! SideMenuCell
        cell.titleMenu.text = menuTitle[indexPath.row]
        cell.imageTitle.image = UIImage(named: imageTitle[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            let nav = SchoolNavController(rootViewController: storyBoard)
         
            self.revealViewController().pushFrontViewController(nav, animated: true)
        }
        else if indexPath.row == 1 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddStudentVC") as! AddStudentVC
            let nav = SchoolNavController(rootViewController: storyBoard)
            self.revealViewController().pushFrontViewController(nav, animated: true)
        }else if indexPath.row == 2 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildsTableViewController") as! ChildsTableViewController
            storyBoard.typefrom = "Financial Situation"
            let nav = SchoolNavController(rootViewController: storyBoard)
            self.revealViewController().pushFrontViewController(nav, animated: true)
        }else if indexPath.row == 3 {
            
        }else if indexPath.row == 4 {
            
        }else if indexPath.row == 5 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChildsTableViewController") as! ChildsTableViewController
            storyBoard.typefrom = "HomeWork"
            let nav = SchoolNavController(rootViewController: storyBoard)
            self.revealViewController().pushFrontViewController(nav, animated: true)
            
        }else if indexPath.row == 6 {
            let storyBoard = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationsTableViewController") as! NotificationsTableViewController
            let nav = SchoolNavController(rootViewController: storyBoard)
            self.revealViewController().pushFrontViewController(nav, animated: true)

        }
        else if indexPath.row == 7 {
            UserStore.removeUser()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
            self.present(vc, animated: true, completion: nil)
    }

    }
}
