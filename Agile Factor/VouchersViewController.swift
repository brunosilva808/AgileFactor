//
//  VouchersViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 15/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class VouchersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Vouchers", aligment: .center)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
