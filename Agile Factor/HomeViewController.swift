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
        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Home".localized, aligment: .center)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentLoginVC(_ sender: AnyObject) {
        presentPassCodeViewController()
    }
    
    func presentPassCodeViewController() {
        let loginVC = PasswordLoginViewController()
        present(loginVC, animated: false, completion: nil)
    }

}
