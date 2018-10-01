//
//	profile.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class profile : NSObject, NSCoding{

	var loginResult : LoginResult!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let loginResultData = dictionary["LoginResult"] as? [String:Any]{
			loginResult = LoginResult(fromDictionary: loginResultData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if loginResult != nil{
			dictionary["LoginResult"] = loginResult.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         loginResult = aDecoder.decodeObject(forKey: "LoginResult") as? LoginResult

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if loginResult != nil{
			aCoder.encode(loginResult, forKey: "LoginResult")
		}

	}

}
