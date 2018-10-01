//
//  ProfileVC.swift
//  ormanSchools
//
//  Created by zoza on 11/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class ProfileVC: BaseSideVC {

    @IBOutlet weak var fNameTxt: UITextField!
    @IBOutlet weak var lNameTxt: UITextField!
    @IBOutlet weak var mobTxt: UITextField!
    @IBOutlet weak var mailTxt: UITextField!
    @IBOutlet weak var usrTxt: UITextField!
    @IBOutlet weak var chldrnTxt: UITextField!
    
    var loginResult = [LoginResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appenddData()
        
        print(UserStore.loadUser()?.parentId ?? 0)
        
    }
    
    
    
    func appenddData(){
        fNameTxt.text = UserStore.loadUser()?.firstName ?? ""
        lNameTxt.text = UserStore.loadUser()?.lastName ?? ""
        mobTxt.text = UserStore.loadUser()?.mobileNo ?? ""
        mailTxt.text = UserStore.loadUser()?.email ?? ""
        usrTxt.text = UserStore.loadUser()?.userName ?? ""
        chldrnTxt.text = "\(UserStore.loadUser()?.childrenNo ?? 0)"
    }
    
   

    @IBAction func edtProflBtnActn(_ sender: Any) {
        guard let first = fNameTxt.text, !first.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let last = lNameTxt.text, !last.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let mob = mobTxt.text, !mob.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let mail = mailTxt.text, !mail.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let user = usrTxt.text, !user.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        let id = UserStore.loadUser()?.parentId
        startAnimating()
        API.init().editProfile(Id: id!, FirstName: first, LastName: last, UserName: user, Mobile: mob, Email: mail)
        {(done) in
            if done {
                print("Edited")
                self.showAlert("Profile edited Successfully", "Success")
                self.stopAnimating()
            }
            else {
                self.showAlert("Enter valid user data", "Warning")
                return
            }
        }

    }
    
}
