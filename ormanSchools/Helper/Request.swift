//
//  Request.swift
//  ormanSchools
//
//  Created by zoza on 02/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Request {
    
    // singleton object......
    static let shared = Request()
    private init() { }
    
    func request(url:String , method: HTTPMethod ,parameters:[String: Any] = [:] , completion: @escaping (_ data:JSON?, _ success: Bool?, _ error: JSON?) -> ()) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: ["Accept": "application/json" , "Content-Type": "application/json"])
            .validate(statusCode: 200...422)
            .responseJSON { (response) in
                
                switch response.result {
                case .failure( _):
                    print(response.error?.localizedDescription ?? "")
                    completion(nil, false, nil)
                case .success(let value):
                    let json = JSON(value)
                    if let resp = response.response {
                        if resp.statusCode == 422
                        {
                            completion(nil, false, json)
                        }
                        else
                        {
                            let data = json//["data"]
                            completion(data, true, nil)
                        }
                    }
                    
                }
        }
    }
    
    func requestJson(url:String , method: HTTPMethod ,parameters:[String: Any] = [:] , completion: @escaping (_ data:JSON?, _ success: Bool?, _ error: JSON?) -> ()) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: ["Accept": "application/json" , "Content-Type": "application/json"])
            .validate(statusCode: 200...422)
            .responseJSON { (response) in
                
                switch response.result {
                case .failure( _):
                    print(response.error?.localizedDescription ?? "")
                    completion(nil, false, nil)
                case .success(let value):
                    let json = JSON(value)
                    if let resp = response.response {
                        if resp.statusCode == 422
                        {
                            completion(nil, false, json)
                        }
                        else
                        {
                            let data = json//["data"]
                            completion(data, true, nil)
                        }
                    }
                    
                }
        }
    }

    
}
