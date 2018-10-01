//
//  MainTextField.swift
//  ormanSchools
//
//  Created by zoza on 04/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import UIKit

class MainTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 15)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}

