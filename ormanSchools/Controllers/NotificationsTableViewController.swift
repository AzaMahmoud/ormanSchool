//
//  NotificationsTableViewController.swift
//  ormanSchools
//
//  Created by Mostafa on 10/1/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class NotificationsTableViewController: UITableViewController {

    var notifyArray: [Notifications] = []
    var type: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        title = "Notifications"
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        if type == "appDel"{
            backButton()
        }else{
            menuButton()
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = 300
            self.revealViewController().rearViewRevealDisplacement = 50
            self.revealViewController().toggleAnimationDuration = 0.5
            self.revealViewController().toggleAnimationType = .spring
            self.revealViewController().frontViewShadowColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            
        }
        
    }
    
    func menuButton(){
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu") , style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(animated:)))
        self.navigationItem.setLeftBarButton(barButton, animated: true)
    }
    
    func backButton(){
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "details_back_icon") , style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.setLeftBarButton(barButton, animated: true)
    }
    
    @objc func backAction(){
        guard let window = UIApplication.shared.keyWindow else { return }
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        window.rootViewController = viewController

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notifyArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notifyCell", for: indexPath) as! NotifyCell
        cell.config(notifyArray[indexPath.row])
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func loadData(){
        startAnimating()
        API.init().getAllNotification(parentID: UserStore.loadUser()?.parentId ?? 0) { (done, notifications) in
            if done {
                self.notifyArray = notifications
                self.stopAnimating()
                self.tableView.reloadData()
            }else{
                self.stopAnimating()
            }

        }
        
    }
    

}
