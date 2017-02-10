//
//  PointsViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Points".localized, aligment: .center)
        
        getBalanceAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getBalanceAPI() {
        API.sharedInstance.memberBalance(member: Member()) { Member in
            Swift.debugPrint("Balance WebService")
        }
    }

}
