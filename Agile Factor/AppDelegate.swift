//
//  AppDelegate.swift
//  Agile Factor
//
//  Created by Bruno Silva on 06/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = LoginViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        // UI Global Customization
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 0, green: 122, blue: 255, alpha: 1)
        ViewHelper.setupStatusBar(statusBarStyle: .default)
        
        return true
    }

}

