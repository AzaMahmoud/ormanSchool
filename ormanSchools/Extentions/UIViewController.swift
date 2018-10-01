//
//  UIViewController.swift
//  ormanSchools
//
//  Created by zoza on 25/08/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController : NVActivityIndicatorViewable {
    
    func startLoading(){
        let size = CGSize(width: 50, height: 50)
        NVActivityIndicatorView.DEFAULT_COLOR = #colorLiteral(red: 0.4565047026, green: 0, blue: 0.1442630887, alpha: 1)
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.startAnimating(size, message: "", type: NVActivityIndicatorType.ballScaleMultiple)
    }
    
    func stopLoading(){
        self.stopAnimating()
    }
    func showAlert(_ message: String , _ title: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: nil))
        self.present(alertController , animated: true)
    }

    
    
    
    
    
    
  
    
    
}
