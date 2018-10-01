//
//  User.swift
//  ormanSchools
//
//  Created by zoza on 11/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: NSObject , NSCoding {
    
    
    var childrenNo : Int?
    var email : String?
    var firstName : String?
    var lastName : String?
    var mobileNo : String?
    var parentId : Int?
    var password : String?
    var userName : String?
    
    
    required init(_ data : JSON) {
        super.init()
        childrenNo = data["ChildrenNo"].int
        email = data["Email"].string
        firstName = data["FirstName"].string
        lastName = data["LastName"].string
        mobileNo = data["MobileNo"].string
        parentId = data["ParentId"].int
        password = data["Password"].string
        userName = data["UserName"].string

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(childrenNo, forKey: "ChildrenNo")
        aCoder.encode(email, forKey: "Email")
        aCoder.encode(firstName, forKey: "FirstName")
        aCoder.encode(lastName, forKey: "LastName")
        aCoder.encode(mobileNo, forKey: "MobileNo")
        aCoder.encode(parentId, forKey: "ParentId")
        aCoder.encode(password, forKey: "Password")
        aCoder.encode(userName, forKey: "UserName")

    }
    
    required init?(coder aDecoder: NSCoder) {
        childrenNo = aDecoder.decodeObject(forKey: "ChildrenNo") as? Int
        email = aDecoder.decodeObject(forKey: "Email") as? String
        firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
        lastName = aDecoder.decodeObject(forKey: "LastName") as? String
        mobileNo = aDecoder.decodeObject(forKey: "MobileNo") as? String
        parentId = aDecoder.decodeObject(forKey: "ParentId") as? Int
        password = aDecoder.decodeObject(forKey: "Password") as? String
        userName = aDecoder.decodeObject(forKey: "UserName") as? String

    }

    
    
}
