//
//  UserStore.swift
//  ormanSchools
//
//  Created by zoza on 11/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

class UserStore {
    
    private static let UserKey = "User"
    private static func archiveUser(_ user :User) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: user as User) as NSData
    }
    
    static func loadUser() -> User? {
        if let unarchivedObject = UserDefaults.standard.object(forKey: UserKey) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? User
        }
        return nil
    }
    
    static func saveUser(_ user : User?) {
        let archivedObject = archiveUser(user!)
        UserDefaults.standard.set(archivedObject, forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
}
