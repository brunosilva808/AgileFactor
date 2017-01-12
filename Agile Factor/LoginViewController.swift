//
//  LoginViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 06/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Class Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NSLog(LibraryAPI.sharedInstance.getAlbums(), 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    @IBAction func loginButtonTouched(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = TabBarViewController()
        
//        let statusBarBackgroundView = UIView()
//        statusBarBackgroundView.backgroundColor =  UIColor.rgb(red: 194, green: 31, blue: 31, alpha: 1)
//        appDelegate.window?.addSubview(statusBarBackgroundView)
//        appDelegate.window?.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
//        appDelegate.window?.addConstraintsWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
        
        ViewHelper.setupStatusBar()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
