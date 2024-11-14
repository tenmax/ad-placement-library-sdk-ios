//
//  AppDelegate.swift
//  sdkdemo
//
//  Created by Picker Weng on 2024/7/27.
//

import UIKit
import TenMaxMobileAdsSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {
            // do only pure app launch stuff, not interface stuff
        } else {
            TenMaxMobileSDK.initiate(configuration: TenMaxSdkConfiguration.configuration) { spaces, error in
                if let error {
                    print (error)
                } else {
                    print (spaces)
                }
            }
            
            UINavigationBar.appearance().barTintColor = .main
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().isTranslucent = false
            
            let window = UIWindow(frame: UIScreen.main.bounds)
            let homeVC = HomeViewController()
            let navigationController = UINavigationController(rootViewController: homeVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            self.window = window
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

