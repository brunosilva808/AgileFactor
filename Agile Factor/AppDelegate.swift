//
//  AppDelegate.swift
//  Agile Factor
//
//  Created by Bruno Silva on 06/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import CoreData
import DATAStack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var dataStack: DATAStack = DATAStack(modelName: "Model")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if API.sharedInstance.keychain.getFromKeychain(key: K.Secure.passwordKey) != nil {
            presentTabBarViewController()
            ViewHelper.setupStatusBar(statusBarStyle: .lightContent)
        } else {
            presentLoginViewController()
            ViewHelper.setupStatusBar(statusBarStyle: .default)
        }
        
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        setupNavigationBarColor(red: 0, green: 122, blue: 255, alpha: 1)
        
        return true
    }
    
    // Setup
    
    func setupNavigationBarColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // UINavigation
    
    func presentLoginViewController()  {
        window?.rootViewController = LoginViewController()
        ViewHelper.setupStatusBar(statusBarStyle: .default)
    }
    
    func presentPinViewController()  {
        let pinVC = PinViewController()
        let navigationVC = UINavigationController(rootViewController: pinVC)
        window?.rootViewController = navigationVC
        ViewHelper.setupStatusBar(statusBarStyle: .default)
    }
    
    func presentTabBarViewController()  {
        window?.rootViewController = TabBarViewController()
        ViewHelper.setupStatusBar(statusBarStyle: .lightContent)
    }

}

