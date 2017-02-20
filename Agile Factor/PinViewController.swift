//
//  PinViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 15/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class PinViewController: UIViewController {

    // UIComponents
    
    let logoImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "logo")
        return imageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.blueSystem()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Login".localized, for: .normal)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blueSystem().cgColor
        button.setTitleColor(UIColor.blueSystem(), for: .normal)
        button.setTitle("Sign Up".localized, for: .normal)
        return button
    }()
    
    // MARK: - Var
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewHelper.setupStatusBar(statusBarStyle: .lightContent)
        setupUI()

        ViewHelper.setTransparentNavigationBar(navigationController: navigationController!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SetupUI
    
    internal func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        view.addConstraint(NSLayoutConstraint(item: logoImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        view.addConstraintsWithFormat(format: "V:|-50-[v0(160)]-200-[v1(40)]-10-[v2(40)]", views: logoImageView, loginButton, signUpButton)
    
        view.addConstraintsWithFormat(format: "H:[v0(160)]", views: logoImageView)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: loginButton)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: signUpButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTouched), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTouched), for: .touchUpInside)
    }
    
    // MARK: - UINavigation
    
    func presentLoginViewController() {
        let loginVC = PasswordLoginViewController()
        loginVC.title = "Login"
        loginVC.mode = .secondLogin
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func presentSignUpViewController() {
        let loginVC = PasswordLoginViewController()
        loginVC.title = "Sign Up".localized
        loginVC.mode = .firstLogin
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    // MARK: - IBAction
    
    @IBAction func loginButtonTouched(sender: Any) {
        presentLoginViewController()
    }
    
    @IBAction func signUpButtonTouched(sender: Any) {
        presentSignUpViewController()
    }
    
}
