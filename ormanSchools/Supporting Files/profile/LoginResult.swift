//
//	LoginResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class LoginResult : NSObject, NSCoding{

	var childrenNo : Int!
	var email : String!
	var firstName : String!
	var lastName : String!
	var mobileNo : String!
	var parentId : Int!
	var password : String!
	var userName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		childrenNo = dictionary["ChildrenNo"] as? Int
		email = dictionary["Email"] as? String
		firstName = dictionary["FirstName"] as? String
		lastName = dictionary["LastName"] as? String
		mobileNo = dictionary["MobileNo"] as? String
		parentId = dictionary["ParentId"] as? Int
		password = dictionary["Password"] as? String
		userName = dictionary["UserName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if childrenNo != nil{
			dictionary["ChildrenNo"] = childrenNo
		}
		if email != nil{
			dictionary["Email"] = email
		}
		if firstName != nil{
			dictionary["FirstName"] = firstName
		}
		if lastName != nil{
			dictionary["LastName"] = lastName
		}
		if mobileNo != nil{
			dictionary["MobileNo"] = mobileNo
		}
		if parentId != nil{
			dictionary["ParentId"] = parentId
		}
		if password != nil{
			dictionary["Password"] = password
		}
		if userName != nil{
			dictionary["UserName"] = userName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         childrenNo = aDecoder.decodeObject(forKey: "ChildrenNo") as? Int
         email = aDecoder.decodeObject(forKey: "Email") as? String
         firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
         lastName = aDecoder.decodeObject(forKey: "LastName") as? String
         mobileNo = aDecoder.decodeObject(forKey: "MobileNo") as? String
         parentId = aDecoder.decodeObject(forKey: "ParentId") as? Int
         password = aDecoder.decodeObject(forKey: "Password") as? String
         userName = aDecoder.decodeObject(forKey: "UserName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if childrenNo != nil{
			aCoder.encode(childrenNo, forKey: "ChildrenNo")
		}
		if email != nil{
			aCoder.encode(email, forKey: "Email")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "FirstName")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "LastName")
		}
		if mobileNo != nil{
			aCoder.encode(mobileNo, forKey: "MobileNo")
		}
		if parentId != nil{
			aCoder.encode(parentId, forKey: "ParentId")
		}
		if password != nil{
			aCoder.encode(password, forKey: "Password")
		}
		if userName != nil{
			aCoder.encode(userName, forKey: "UserName")
		}

	}

}