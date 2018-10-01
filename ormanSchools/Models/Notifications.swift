//
//  Notifications.swift
//  ormanSchools
//
//  Created by Mostafa on 10/1/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import SwiftyJSON

//"DeviceId": null,


class Notifications: NSObject{
    var isNew : Int?
    var notificationId : Int?
    var notificationDes : String?
    var notificationDateTime : String?
    var studentName : String?
    
    required init(_ data : JSON){
        isNew = data["IsNew"].int
        notificationId = data["NotificationId"].int
        notificationDes = data["Notification"].string
        notificationDateTime = data["NotificationDateTime"].string
        studentName = data["StudentName"].string
    }
    
}

