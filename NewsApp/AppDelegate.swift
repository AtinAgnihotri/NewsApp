//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Atin Agnihotri on 04/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setNavBarAppearance()
        return true
    }
    
    
    func setNavBarAppearance() {
        let titleAttrs: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white]
        let backgroundColor: UIColor = .systemTeal
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = titleAttrs
            navBarAppearance.largeTitleTextAttributes = titleAttrs
            navBarAppearance.backgroundColor = backgroundColor
            
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        } else {
            UINavigationBar.appearance().barTintColor = backgroundColor
            UINavigationBar.appearance().largeTitleTextAttributes = titleAttrs
            UINavigationBar.appearance().titleTextAttributes = titleAttrs
        }
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

