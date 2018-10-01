//
//  SignUpVC.swift
//  ormanSchools
//
//  Created by zoza on 04/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class SignUpVC: UITableViewController {

    @IBOutlet weak var frstTxt: MainTextField!
    
    @IBOutlet weak var lstTxt: MainTextField!
    
    @IBOutlet weak var mailTxt: MainTextField!
    
    @IBOutlet weak var mobTxt: MainTextField!
    
    @IBOutlet weak var usrTxt: MainTextField!
    
    @IBOutlet weak var pswrdTxt: MainTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func registerBtnActn(_ sender: UIButton) {
        guard let first = frstTxt.text, !first.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let last = lstTxt.text, !last.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let mail = mailTxt.text, !mail.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let mobile = mobTxt.text, !mobile.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let user = usrTxt.text, !user.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let pswrd = pswrdTxt.text, !pswrd.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        
        startAnimating()
        API.init().register(FirstName: first, LastName: last, Email: mail, Mobile: mobile, UserName: user, Password: pswrd) {(done) in
            if done {
                print("Registered")
                self.showAlert("Registered Successfully", "Success")
                self.stopAnimating()
            }
            else {
                self.showAlert("Enter valid user", "Warning")
                return
            }
        }






        
        
        
    }
    


    




}
