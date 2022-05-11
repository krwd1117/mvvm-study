//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Jeongwan Kim on 2022/05/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        let navibationBar = UINavigationBar.appearance()
        
        navibationBar.backgroundColor = UIColor(displayP3Red: 52/255, green: 125/255, blue: 219/255, alpha: 1.0)
        navibationBar.barTintColor = UIColor(displayP3Red: 52/255, green: 125/255, blue: 219/255, alpha: 1.0)
        navibationBar.tintColor = .white
        navibationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navibationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
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

