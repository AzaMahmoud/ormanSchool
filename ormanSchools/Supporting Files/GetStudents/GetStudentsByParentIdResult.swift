//
//	GetStudentsByParentIdResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class GetStudentsByParentIdResult : NSObject, NSCoding{

	var parentId : Int!
	var studentId : Int!
	var studentName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		parentId = dictionary["ParentId"] as? Int
		studentId = dictionary["StudentId"] as? Int
		studentName = dictionary["StudentName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if parentId != nil{
			dictionary["ParentId"] = parentId
		}
		if studentId != nil{
			dictionary["StudentId"] = studentId
		}
		if studentName != nil{
			dictionary["StudentName"] = studentName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         parentId = aDecoder.decodeObject(forKey: "ParentId") as? Int
         studentId = aDecoder.decodeObject(forKey: "StudentId") as? Int
         studentName = aDecoder.decodeObject(forKey: "StudentName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if parentId != nil{
			aCoder.encode(parentId, forKey: "ParentId")
		}
		if studentId != nil{
			aCoder.encode(studentId, forKey: "StudentId")
		}
		if studentName != nil{
			aCoder.encode(studentName, forKey: "StudentName")
		}

	}

}