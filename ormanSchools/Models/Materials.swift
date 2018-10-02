//
//  Materials.swift
//  ormanSchools
//
//  Created by Mostafa on 10/2/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

class Materials: NSObject{

    var fileID : Int?
    var name : String?
    var url : String?
    var contentType : String?
    
    required init(_ data : JSON){
        fileID = data["FileID"].int
        name = data["Name"].string
        url = data["Url"].string
        contentType = data["ContentType"].string

    }
    
}

