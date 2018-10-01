//
//	students.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class students : NSObject, NSCoding{

	var getStudentsByParentIdResult : [GetStudentsByParentIdResult]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		getStudentsByParentIdResult = [GetStudentsByParentIdResult]()
		if let getStudentsByParentIdResultArray = dictionary["GetStudentsByParentIdResult"] as? [[String:Any]]{
			for dic in getStudentsByParentIdResultArray{
				let value = GetStudentsByParentIdResult(fromDictionary: dic)
				getStudentsByParentIdResult.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if getStudentsByParentIdResult != nil{
			var dictionaryElements = [[String:Any]]()
			for getStudentsByParentIdResultElement in getStudentsByParentIdResult {
				dictionaryElements.append(getStudentsByParentIdResultElement.toDictionary())
			}
			dictionary["GetStudentsByParentIdResult"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         getStudentsByParentIdResult = aDecoder.decodeObject(forKey :"GetStudentsByParentIdResult") as? [GetStudentsByParentIdResult]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if getStudentsByParentIdResult != nil{
			aCoder.encode(getStudentsByParentIdResult, forKey: "GetStudentsByParentIdResult")
		}

	}

}