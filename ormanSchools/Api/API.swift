//
//  API.swift
//  ormanSchools
//
//  Created by zoza on 02/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//



import Foundation
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    static var shared = API()
    var loginResult: LoginResult?

    // login
    func login(userName: String , password: String , closure: @escaping(Bool) -> Void ){
        Request.shared.request(url: URLs.login, method: .get, parameters: ["userName": userName , "password" : password]) { (data, sucess, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                print("Welcome, ", data["LoginResult"]["UserName"])
                print("data ====== > " , data)
              // let user = User(data["LoginResult"])
                if data["LoginResult"]["ParentId"].int == 0 {
                    closure(false)
                }
                else{
                    let user = User(data["LoginResult"])
                    UserStore.saveUser(user)
                    closure(true)
                }
            }
        }
    }
    // Register
    func register(FirstName:String, LastName:String, Email:String, Mobile:String, UserName:String, Password:String, closure:@escaping(Bool) -> Void ){
        
        print( ["FirstName":FirstName , "LastName":LastName , "Email":Email , "Mobile":Mobile , "UserName":UserName, "Password":Password] )
        
        Request.shared.requestJson(url: URLs.register, method: .post, parameters: ["FirstName":FirstName , "LastName":LastName , "Email":Email , "Mobile":Mobile , "UserName":UserName, "Password":Password]) {(data, sucess, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                print("data ====== > " , data)
                closure(true)
            }
        }
    }
    

    // EditProfile
    func editProfile(Id:Int, FirstName:String, LastName:String, UserName:String, Mobile:String, Email:String, closure:@escaping(Bool) -> Void) {
        Request.shared.requestJson(url: URLs.editProfile, method: .post, parameters: ["Id":Id ,"FirstName":FirstName, "LastName":LastName, "UserName":UserName, "Mobile":Mobile, "Email":Email]) {(data, success, error) in
            if let error = error {
                print (error)
            }
            if let data = data {
                print("data ====== > " , data)
                closure(true)
            }
        }
    }
     // @GET("/AddStudent") void AddStudent_session(@Query("userName") String usename , @Query("password") String password, @Query("parentId") Integer parentId, Callback<AddStudentResult> AddStudentResult)
    // AddStudent
    func addStudent(userName:String, passWord:String, parentId:Int, closure:@escaping(Bool) -> Void) {
        Request.shared.request(url: URLs.addStudent, method: .get, parameters: ["userName":userName, "password":passWord, "parentId":parentId]) {(data, success, error) in
            if let error = error{
                print(error)
            }
            if let data = data{
                if data["AddStudentResult"].bool == true {
                    closure(true)
                }
                else{
                    closure(false)
                }
                print("AddStudent ====== > " , data)

            }
            
        }
    }
    
    
    // @GET("/GetStudentsByParentId") void GetStudentsByParentId_session(@Query("parentId") Integer parentId, Callback<GetStudentsByParentIdResult> GetStudentsByParentIdResult)
    // GetStudents
    func getStudent(parentId:Int, closure:@escaping(Bool , [Students]) -> Void) {
        Request.shared.request(url: URLs.getStudents, method: .get, parameters: ["parentId":parentId]) {(data, success, error) in
            if let error = error{
                print(error)
            }
            if let data = data {
                print("getStudents ====== > " , data)
                let students = data["GetStudentsByParentIdResult"].map({Students($0.1)})
                closure(true , students)
            }
        }
    }
    
    // @GET("/DeleteStudentByParentId") void DeleteStudentByParentId_session(@Query("parentId") Integer parentId, @Query("studentId") Integer studentId, Callback<DeleteStudentByParentIdResult> DeleteStudentByParentIdResult)
    // DeleteStudentByParentId
    func deletStudent(parentId:Int, studentId:Int, closure:@escaping(Bool) -> Void) {
        Request.shared.request(url: URLs.deletStudent, method: .get, parameters: ["parentId":parentId, "studentId":studentId]) {(data, success, error)
            in
            if let error = error{
                print(error)
            }
            if let data = data {
                print("deletStudent =====> " , data)
                closure(true)
            }
        }
    }

    
    func getParentStudents(parentId:Int, closure:@escaping(Bool , [Students]) -> Void) {
        Request.shared.requestJson(url: URLs.getParentsStudents, method: .post, parameters: ["Parent_Id":parentId]) {(data, success, error) in
            if let error = error{
                print(error)
            }
            if let data = data {
                print("getStudents ====== > " , data)
                let childs = data["GetAllStudenByParentIdResult"].map({Students($0.1)})
                closure(true , childs)
            }
        }
    }
    
    


    
    
    func getSubject(gridId:Int, closure:@escaping(Bool , [Subjects]) -> Void) {
        Request.shared.requestJson(url: URLs.getSubjects, method: .post, parameters: ["Grid_Id":gridId]) {(data, success, error) in
            if let error = error{
                print(error)
            }
            if let data = data {
                print("getStudents ====== > " , data)
                let childs = data["GetSubjectResult"].map({Subjects($0.1)})
                closure(true , childs)
            }
        }
    }

     // @GET("/AddParentDevice") void AddParentDevice_session(@Query("parentId") Integer parentId, @Query("deviceId") String deviceId, Callback<AddParentDeviceResult> AddParentDeviceResult)
    func addMobileToken(parentID:Int, deviceToken:String, closure:@escaping(Bool) -> Void) {
        Request.shared.request(url: URLs.addMobileToken, method: .get, parameters: ["parentId":parentID, "deviceId":deviceToken]) {(data, success, error) in
            if let error = error{
                print(error)
            }
            if let data = data{
                print("AddStudent ====== > " , data)
                if data["AddParentDeviceResult"].int == 1 {
                    closure(true)
                }else{
                    closure(false)
                }
                
            }
            
        }
    }

    
    func getAllNotification(parentID:Int, closure:@escaping(Bool , [Notifications]) -> Void) {
        Request.shared.request(url: URLs.getNotification, method: .get, parameters: ["parentId":parentID]) {(data, success, error) in
            if let error = error{
                print(error)
            }
            if let data = data{
                print("GetNotificationsByParentIdResult ====== > " , data)
                let notify = data["GetNotificationsByParentIdResult"].map({Notifications($0.1)})
                closure(true , notify)
                
            }
            
        }
    }

    
    // @POST("/GetStdufinical") void GetAllFinancialdata(@Query("Pda_id") Int stuId, Callback<Getfinancial> GetStdufinicalResult)
    func getStudentFinancial(studId:Int, closure:@escaping(Bool, [Finance]) -> Void) {
        Request.shared.requestJson(url: URLs.getStdufinical, method: .post, parameters: ["Pda_id":studId])
        {(data, success, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
               print("Finance ======> " , data)
                let finance = data["GetStdufinicalResult"].map({Finance($0.1)})
                closure(true , finance)
            }
        }
    }

    
    
}



