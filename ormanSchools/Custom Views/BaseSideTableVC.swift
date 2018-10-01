//
//  BaseSideTableVC.swift
//  ormanSchools
//
//  Created by zoza on 30/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation

class BaseSideTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vc = self.revealViewController(){
            let sideMenuBtn =  UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: vc, action: #selector(vc.revealToggle(animated:)))
            navigationItem.leftBarButtonItem = sideMenuBtn
            self.view.addGestureRecognizer(vc.panGestureRecognizer())
            self.view.addGestureRecognizer(vc.tapGestureRecognizer())
            vc.rearViewRevealWidth = 300
            vc.rearViewRevealDisplacement = 50
            vc.toggleAnimationDuration = 0.5
            vc.toggleAnimationType = .spring
            vc.frontViewShadowColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }
        
    }
}
