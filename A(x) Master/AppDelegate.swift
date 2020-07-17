//
//  AppDelegate.swift
//  A(x) Master
//
//  Created by El Kevin on 6/5/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Make app DARKS
        UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.dark
               IQKeyboardManager.shared.enable = true
               UITabBar.appearance().barTintColor = .black
               UITabBar.appearance().tintColor = Colors.aXGreen
        
        //Manage wich view is dipplayed at boot
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController
        
//        var isFirstBoot = true
//       // UserDefaults.standard.value(forKey:"bodyweight")as? String == nil
//        if (isFirstBoot) {
        vc = storyBoard.instantiateViewController(identifier: "infoCollection")
//        } else {
//            vc = storyBoard.instantiateInitialViewController()!
//        }
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
             
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

