//
//  HomeViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Property
    let isBlurUI = true
    
    var loginVCID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginVCID = isBlurUI ? "BlurPasswordLoginViewController" : "PasswordLoginViewController"
    }
    
    @IBAction func presentLoginVC(_ sender: AnyObject) {
        present(loginVCID)
    }
    
    func present(_ id: String) {
        let loginVC = PasswordLoginViewController()
        present(loginVC, animated: false, completion: nil)
        
//        let loginVC = storyboard?.instantiateViewController(withIdentifier: id)
//        loginVC?.modalTransitionStyle = .crossDissolve
//        loginVC?.modalPresentationStyle = .overCurrentContext
//        present(loginVC!, animated: true, completion: nil)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Home".localized, aligment: .center)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}
