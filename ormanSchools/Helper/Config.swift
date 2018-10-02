//
//  Config.swift
//  ormanSchools
//
//  Created by zoza on 02/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import Foundation

struct URLs {
    
    static let main = "http://167.114.174.82/AndroidSchoolService.svc"
    
    
    

    //(LOGIN)  GET, void login_session(@Query("userName") String usename , @Query("password") String password, Callback<LoginResult> LoginResult)
    static let login = main + "/Login"
    
    
    
    
    // [@POST(“/Register") void Register_data(@Query("FirstName") String firstname ,@Query("LastName") String LastName ,@Query("FirstName") String firstname ,@Query("Email") String Email ,@Query("Mobile") String Mobile ,@Query("UserName") String UserName ,@Query("Password") String Password, Callback<Regresponse> res)]
    static let register = main + "/Register"
    
    
    
    
// [@POST(“/EditProfile") void Register_data(@Query("Id") Int id ,@Query("FirstName") String firstname ,@Query("LastName") String LastName ,@Query("UserName") String UserName ,@Query("Mobile") String Mobile ,@Query("Email") String Email ,Callback<Regresponse> res)]
    static let editProfile = main + "/EditProfile"
    
    
    
    
    // @GET("/AddStudent") void AddStudent_session(@Query("userName") String usename , @Query("password") String password, @Query("parentId") Integer parentId, Callback<AddStudentResult> AddStudentResult)
    static let addStudent = main + "/AddStudent"
    
    
    
    
    // @GET("/GetStudentsByParentId") void GetStudentsByParentId_session(@Query("parentId") Integer parentId, Callback<GetStudentsByParentIdResult> GetStudentsByParentIdResult)
    static let getStudents = main + "/GetStudentsByParentId"
    
    
    
    // @GET("/DeleteStudentByParentId") void DeleteStudentByParentId_session(@Query("parentId") Integer parentId, @Query("studentId") Integer studentId, Callback<DeleteStudentByParentIdResult> DeleteStudentByParentIdResult)
    static let deletStudent = main + "/DeleteStudentByParentId"

    static let getParentsStudents = main + "/GetAllStudenByParentId"

    static let getSubjects = main + "/GetSubject"
    
    
    // @GET("/AddParentDevice") void AddParentDevice_session(@Query("parentId") Integer parentId, @Query("deviceId") String deviceId, Callback<AddParentDeviceResult> AddParentDeviceResult)
    static let addMobileToken = main + "/AddParentDevice"


    
   // @POST("/GetStdufinical") void GetAllFinancialdata(@Query("Pda_id") Int stuId, Callback<Getfinancial> GetStdufinicalResult)
    static let getStdufinical = main + "/GetStdufinical"
    
    
    static let getNotification = main + "/GetNotificationsByParentId"

    
    // @POST("/Getstdbehaviour2009android")void GetAllbehaviours(@Query("pda_id") Int stuId,("dtfrom") String datFrom,("dtto") String DatTo, Callback<Getbehaviour> res);
    
    
    
    
    
}
