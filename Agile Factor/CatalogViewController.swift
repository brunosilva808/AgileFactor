//
//  CatalogViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import Alamofire

class CatalogViewController:  ProductsViewController {
    
    // MARK: - Class Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Catalog".localized, aligment: .left)
        setupNavBarButtons()
    }

    func setupNavBarButtons(){
        let searchImage = #imageLiteral(resourceName: "nav_search_icon").withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    
    func handleSearch() {
        Swift.debugPrint(123)
    }

    func handleMore() {
        Swift.debugPrint(456)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


