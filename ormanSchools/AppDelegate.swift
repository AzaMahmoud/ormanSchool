//
//  AppDelegate.swift
//  ormanSchools
//
//  Created by zoza on 15/08/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit
import IQKeyboardManager
import Firebase
import FirebaseCore
import FirebaseInstanceID
import FirebaseMessaging
import UserNotifications


//import RevealingSplashView


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  , MessagingDelegate{

    var window: UIWindow?

    //let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "logo"), iconInitialSize: CGSize(width: 200, height: 200), backgroundImage: #imageLiteral(resourceName: "splash"))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().isEnabled = true
        checkLogin()
        FirebaseApp.configure()
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            Messaging.messaging().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in
            })
        }else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        
      //  print(InstanceID.instanceID().token() as! String)
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func checkLogin(){
        if UserStore.loadUser()?.email == nil {
            let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
            self.window?.rootViewController = viewController
        }else{
            let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
            self.window?.rootViewController = viewController
        }
        
    }
    

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string
        let deviceTokenString = deviceToken.hexString
        InstanceID.instanceID().token()
        // Print it to console
        print("FIRInstanceID device token: \(InstanceID.instanceID().token() ?? "")")
        print("APNs device token: \(deviceTokenString)")
        print("APNs device token: \(InstanceID.instanceID().token() ?? "")")
        // UserData.string(forKey: "UserDeviceToken")
        UserDefaults.standard.setValue("\(InstanceID.instanceID().token() ?? "")", forKey: "mobile_token")
        UserDefaults.standard.synchronize()
        print("mobile_token====>" , UserDefaults.standard.value(forKey: "mobile_token") as Any)
        // Persist it in your backend in case it's new
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        Messaging.messaging().shouldEstablishDirectChannel = true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        Messaging.messaging().shouldEstablishDirectChannel = true
        application.applicationIconBadgeNumber = 0

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        completionHandler(.newData) // indicates that new data was successfully fetched
    }
    
    
    func application(received remoteMessage: MessagingRemoteMessage) {
        print("recive remote Message now ................")
    }
    
}
extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if UserStore.loadUser()?.email != nil {
            print("Notification being triggered")
            UIApplication.shared.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
            completionHandler( [.alert,.sound,.badge])
        }
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let data = response.notification.request.content.userInfo
        let accessData = data as! Dictionary<String , AnyObject>
        print(accessData)
        print(response.notification.request.content.userInfo)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let storyBoard = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationsTableViewController") as! NotificationsTableViewController
            storyBoard.type = "appDel"
            let nav = SchoolNavController(rootViewController: storyBoard)
            self.window?.rootViewController = nav
        }
        

    }
    
    
}

extension Data {
    var hexString: String {
        return map { String(format: "%02.2hhx", arguments: [$0]) }.joined()
    }
}
