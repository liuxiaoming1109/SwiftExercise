//
//  AppDelegate.swift
//  SwiftExercise
//
//  Created by liuxm on 15/8/6.
//  Copyright (c) 2015年 evan. All rights reserved.
//

import UIKit
import AVOSCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 远程推送
        self.avOSCloudPushInit(application, launchOptions: launchOptions)

        return true
    }
    
    /**
     注册成功，APNs 会返回给你设备的 token，iOS 系统会把它传递给 app delegate 代理
     
     - parameter application: application
     - parameter deviceToken: deviceToken
     */
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("Receive DeviceToken: %@", deviceToken)
        // token 保存到 AVOS Cloud 后台
        let currentInstallation = AVInstallation.currentInstallation()
        currentInstallation.setDeviceTokenFromData(deviceToken)
        currentInstallation.saveInBackground()
    }
    
    /**
     注册失败
     
     - parameter application: application
     - parameter error:       error
     */
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("注册失败，无法获取设备 ID, 具体错误: %@", error);
    }
    
    /**
     如果远程消息发送过来的时候，app 正在运行, 同时远程消息中的 payload 数据会作为参数传递进去
     
     - parameter application: application
     - parameter userInfo:    userInfo
     */
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        if application.applicationState == UIApplicationState.Active {
            // 转换成一个本地通知，显示到通知栏，你也可以直接显示出一个 alertView，只是那样稍显 aggressive：
            let localNotification = UILocalNotification()
            localNotification.userInfo = userInfo
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.alertBody = userInfo["aps"]?.objectForKey("alert") as? String
            localNotification.fireDate = NSDate()
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        } else {
            AVAnalytics.trackAppOpenedWithRemoteNotificationPayload(userInfo)
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    /**
     使用AVOSCloud 进行远程推送
     */
    func avOSCloudPushInit(application: UIApplication, launchOptions: [NSObject: AnyObject]?) {
        // 使用AVOSCloud管理远程推送
        AVOSCloud.setApplicationId("MP9Oqipt5Rkt5PIb8HYch5YF", clientKey: "gmjP9UItzQco4Fb90zqCA74J")
        
        AVOSCloud.setLastModifyEnabled(true)
        AVOSCloud.registerForRemoteNotification()
        
        application.applicationIconBadgeNumber = 0
        
        // 注册推送通知
        if #available(iOS 8.0, *) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [UIUserNotificationType.Alert, UIUserNotificationType.Badge, UIUserNotificationType.Sound], categories: nil))
            application.registerForRemoteNotifications()
        } else {
            // Fallback on earlier versions
            application.registerForRemoteNotificationTypes([UIRemoteNotificationType.Alert, UIRemoteNotificationType.Badge, UIRemoteNotificationType.Sound])
        }
        
        if (launchOptions != nil) {
            AVAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        }
    }
    

}

