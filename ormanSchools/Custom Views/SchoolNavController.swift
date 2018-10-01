//
//  SchoolNavController.swift
//  ormanSchools
//
//  Created by zoza on 16/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class SchoolNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.1176470588, blue: 0.07843137255, alpha: 1)
        self.navigationBar.tintColor = UIColor.white
        
        let paragraph = NSMutableParagraphStyle()
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.paragraphStyle :paragraph ,NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if #available(iOS 11.0, *) {
            self.navigationBar.largeTitleTextAttributes = [ NSAttributedStringKey.foregroundColor: UIColor.white]
        } else {
        }
        
        self.view.backgroundColor = #colorLiteral(red: 0.5215686275, green: 0.1176470588, blue: 0.07843137255, alpha: 1)
        self.navigationBar.backgroundColor = #colorLiteral(red: 0.5215686275, green: 0.1176470588, blue: 0.07843137255, alpha: 1)
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()

    }

    

}
