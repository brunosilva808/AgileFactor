//
//  HomeViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIWebViewDelegate {
    
    //MARK: - Var
    
    let isBlurUI = true
    
    let webView: UIWebView = {
        let webview = UIWebView()
        return webview
    }()
    
    var loginVCID: String!
    
    //MARK: - Class Logic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Home".localized, aligment: .center)
        
        setupComponents()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setup
    
    func setupComponents(){
        let url = URL(string: "http://www.sapo.pt")
        webView.loadRequest(URLRequest(url: url!))
        webView.delegate = self;
    }
    
    func setupUI(){
        view.addSubview(webView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: webView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: webView)
    }
    
    //MARK: - UINavigation
    
    func presentPassCodeViewController() {
        let loginVC = PasswordLoginViewController()
        present(loginVC, animated: false, completion: nil)
    }
    
}
