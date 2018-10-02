//
//  Students.swift
//  ormanSchools
//
//  Created by zoza on 23/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

class Students: NSObject{
    var class_id : Int?
    var ParentId : Int?
    var StudentId : Int?
    var StudentName : String?
    var grid_id : Int?
    
    required init(_ data : JSON){
        class_id = data["Class_id"].int
        ParentId = data["ParentId"].int
        StudentId = data["StudentId"].int
        StudentName = data["StudentName"].string
        grid_id = data["grid_id"].int
    }
    
}

