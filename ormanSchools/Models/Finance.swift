//
//  Finance.swift
//  ormanSchools
//
//  Created by zoza on 30/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

class Finance: NSObject {
    var title : String?
    var total : Int?
    var discount : Int?
    var paid : Int?
    var remain : String?
    
    required init(_ data : JSON) {
        super.init()
        title = data["expadescreption"].string
        total = data["TotalDept"].int
        discount = data["TotalDis"].int
        paid = data["TotalPaid"].int
        remain = data["TotalRem"].string
    }
    
    
    
}
