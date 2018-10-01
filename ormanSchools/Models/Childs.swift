//
//  Students.swift
//  ormanSchools
//
//  Created by Mostafa on 9/24/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

class Childs: NSObject {
    
    var class_id : Int?
    var parentId : Int?
    var studentId : Int?
    var studentName : String?
    var grid_id : Int?
    
    
    required init(_ data : JSON) {
        super.init()
        class_id = data["Class_id"].int
        parentId = data["ParentId"].int
        studentId = data["StudentId"].int
        studentName = data["StudentName"].string
        grid_id = data["grid_id"].int
    }
}
