//
//  BalancesViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import DATAStack
import CoreData

class BalancesViewController: UIViewController {

    // MARK: - Class Logic
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Balances".localized, aligment: .center)
        
        balanceAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func balanceAPI() {
        API.sharedInstance.memberBalance() { Member in
            Swift.debugPrint("Balance WebService")
        }
    }

}
