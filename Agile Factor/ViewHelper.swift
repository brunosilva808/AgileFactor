//
//  Helper.swift
//  Agile Factor
//
//  Created by Bruno Silva on 12/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class ViewHelper {
    
    static func setupStatusBar(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor =  UIColor.rgb(red: 194, green: 31, blue: 31, alpha: 1)
        appDelegate.window?.addSubview(statusBarBackgroundView)
        appDelegate.window?.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
        appDelegate.window?.addConstraintsWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
    }
    
    static func setupNavBarTitle(navBar: UINavigationController, navItem: UINavigationItem, view: UIView, title: String) {
        navBar.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.text = " " + title
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)

        navItem.titleView = titleLabel
    }
    
    static func setupNavBarButtons(searchSelector: Selector, moreSelector: Selector, navItem: UINavigationItem){
        let searchImage = #imageLiteral(resourceName: "nav_search_icon").withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: searchSelector)
        
        let moreImage = #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: moreSelector)
        
        navItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }

}
