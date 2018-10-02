//
//  LogInVC.swift
//  ormanSchools
//
//  Created by zoza on 27/08/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit
import TextFieldEffects
import RevealingSplashView

class LogInVC: UIViewController {

    
    @IBOutlet weak var userName: TextFieldEffects!
    @IBOutlet weak var password: TextFieldEffects!
    
    var loginResult = [LoginResult]()
    let prefillTextFields = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "logo"), iconInitialSize: CGSize(width: 250, height: 250), backgroundImage: #imageLiteral(resourceName: "splash"))
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.woobleAndZoomOut

        revealingSplashView.startAnimation()
        
        guard prefillTextFields == true else { return }
        
            }

   
    @IBAction func loginPrsd(_ sender: UIButton) {
        guard let user = userName.text, !user.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let pswrd = password.text , !pswrd.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        startAnimating()
        API.init().login(userName: user, password: pswrd) { (done) in
            if done {
                print("loggedIn")
                self.stopAnimating()
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
                
                if let token = UserDefaults.standard.object(forKey: "mobile_token"){
                    
                    API.shared.addMobileToken(parentID: UserStore.loadUser()?.parentId ?? 0, deviceToken: token as! String) { (done) in
                        if done {
                            print("Done")
                        }else{
                            print("Error")
                        }
                        
                    }
                }
                
                self.present(storyBoard , animated: true)
                
            }else {
                self.stopAnimating()
                self.showAlert("Enter valid username and password", "Warning")
            }
        }
    }
    

   

}
