//
//  Subjects.swift
//  ormanSchools
//
//  Created by Mostafa on 9/24/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

class Subjects: NSObject {
    
    var subID : Int?
    var subAname : String?
    
    required init(_ data : JSON) {
        super.init()
        subID = data["SubID"].int
        subAname = data["SubAname"].string
    }
}
