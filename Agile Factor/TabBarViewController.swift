//
//  TabBarViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHelper.setupStatusBar(statusBarStyle: .lightContent)
        
        // Implement View Controllers
        let myVC1 = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let myVC2 = VoucherViewController(nibName: "VoucherViewController", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        let myVC3 = CatalogViewController(collectionViewLayout: layout)
        let myVC4 = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
        
        let navController1 = UINavigationController(rootViewController: myVC1)
        let navController2 = UINavigationController(rootViewController: myVC2)
        let navController3 = UINavigationController(rootViewController: myVC3)
        let navController4 = UINavigationController(rootViewController: myVC4)
        
        let controllers = [navController1,navController2,navController3,navController4]
        self.viewControllers = controllers
        
        // Icon images
        let firstImage = UIImage(named: "home")
        let secondImage = UIImage(named: "heart")
        
        // Tab bar customization 
        myVC1.tabBarItem = UITabBarItem(
            title: "Home".localized,
            image: firstImage,
            tag: 1)
        myVC2.tabBarItem = UITabBarItem(
            title: "Points".localized,
            image: secondImage,
            tag:2)
        myVC3.tabBarItem = UITabBarItem(
            title: "Catalog".localized,
            image: secondImage,
            tag:3)
        myVC4.tabBarItem = UITabBarItem(
            title: "Settings".localized,
            image: secondImage,
            tag:4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
