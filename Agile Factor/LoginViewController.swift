//
//  LoginViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 06/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // UIComponents
    
    let logoImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "logo")
        return imageView
    }()
    
    let usernameTextfield: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.blueSystem().cgColor
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Username".localized
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.blueSystem().cgColor
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Password".localized
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.blueSystem()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Login".localized, for: .normal)
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.blueSystem(), for: .normal)
        button.setTitle("Sign In".localized, for: .normal)
        return button
    }()

    let forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.blueSystem(), for: .normal)
        button.setTitle("Forgot Password".localized, for: .normal)
        return button
    }()
    
    // MARK: - Class Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewHelper.setupStatusBar(statusBarStyle: .lightContent)
        setupUI()
        Swift.debugPrint(self.loginButton.center.y)
        introUIAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SetupUI
    
    internal func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(usernameTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(loginButton)
        view.addSubview(signInButton)
        view.addSubview(forgetPasswordButton)

        view.addConstraint(NSLayoutConstraint(item: logoImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        view.addConstraintsWithFormat(format: "V:|-70-[v0(160)]-50-[v1(40)]-10-[v2(40)]-20-[v3(40)]-10-[v4(40)]", views: logoImageView, usernameTextfield, passwordTextfield, loginButton, signInButton)

        view.addConstraintsWithFormat(format: "H:[v0(160)]", views: logoImageView)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: usernameTextfield)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: passwordTextfield)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: loginButton)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: signInButton)
        view.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: forgetPasswordButton)
        view.addConstraintsWithFormat(format: "V:[v0]-10-|", views: forgetPasswordButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTouched), for: .touchUpInside)
    }
    
    internal func introUIAnimation() {
        
        loginButton.center.y -= 390
        loginButton.alpha = 0
        usernameTextfield.center.y -= 350
        usernameTextfield.alpha = 0
        passwordTextfield.center.y -= 280
        passwordTextfield.alpha = 0
        loginButton.alpha = 0
        signInButton.alpha = 0
        forgetPasswordButton.alpha = 0
        self.logoImageView.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.loginButton.center.y += 390
            self.loginButton.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.passwordTextfield.center.y += 350
            self.passwordTextfield.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.usernameTextfield.center.y += 280
            self.usernameTextfield.alpha = 1
        }, completion: { bool in
            if bool == true {
                UIView.animate(withDuration: 0.3, animations: {
                    self.logoImageView.alpha = 1
                    self.loginButton.alpha = 1
                    self.signInButton.alpha = 1
                    self.forgetPasswordButton.alpha = 1
                })
            }
        })
        
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//            self.passwordTextfield.center.y += 350
//            self.passwordTextfield.alpha = 1
//        }, completion: nil)
        
//        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
//            self.usernameTextfield.center.y += 280
//            self.usernameTextfield.alpha = 1
//            self.loginButton.alpha = 1
//            self.signInButton.alpha = 1
//            self.forgetPasswordButton.alpha = 1
//        }, completion: nil)
        
    }
    
    internal func outroUIAnimation() {
        
//        loginButton.center.y += 390
//        loginButton.alpha = 1
//        usernameTextfield.center.y += 350
//        usernameTextfield.alpha = 1
//        passwordTextfield.center.y += 280
//        passwordTextfield.alpha = 1
//        loginButton.alpha = 1
//        signInButton.alpha = 1
//        forgetPasswordButton.alpha = 1
//        self.logoImageView.alpha = 1
        
        Swift.debugPrint(self.loginButton.center.y)
        
        UIView.animate(withDuration: 0.5, delay: 2.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            Swift.debugPrint(self.loginButton.center.y)
            
            self.loginButton.center.y += 390
            self.loginButton.alpha = 1
        }, completion: nil)
        
//        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.passwordTextfield.center.y -= 350
//            self.passwordTextfield.alpha = 0
//        }, completion: nil)
//        
//        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.usernameTextfield.center.y -= 280
//            self.usernameTextfield.alpha = 0
//        }, completion: { bool in
//            if bool == true {
//                UIView.animate(withDuration: 0.3, animations: {
//                    self.logoImageView.alpha = 0
//                    self.loginButton.alpha = 0
//                    self.signInButton.alpha = 0
//                    self.forgetPasswordButton.alpha = 0
//                })
//            }
//        })
        
        //        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
        //            self.passwordTextfield.center.y += 350
        //            self.passwordTextfield.alpha = 1
        //        }, completion: nil)
        
        //        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
        //            self.usernameTextfield.center.y += 280
        //            self.usernameTextfield.alpha = 1
        //            self.loginButton.alpha = 1
        //            self.signInButton.alpha = 1
        //            self.forgetPasswordButton.alpha = 1
        //        }, completion: nil)
        
    }
    
    
    // API
    
    func loginAPI(){
        
        weak var weakSelf = self
        
        API.sharedInstance.login(username: usernameTextfield.text!, password: passwordTextfield.text!, completion: { response in
            
            guard response == true else {
                let alert = UIAlertController.alertView(title: "Login".localized, message: "Credentials invalid!".localized, buttonTitle: "Ok")
                weakSelf?.present(alert, animated: true, completion: nil)
                
                return
            }
            
            DispatchQueue.main.async {
                weakSelf?.presentViewController()
            }
        })
    }
    
    func presentViewController() {
        let loginVC = PasswordLoginViewController()
        present(loginVC, animated: false, completion: nil)
    }
        
    // MARK: - IBAction
    
    @IBAction func loginButtonTouched(sender: Any) {
        guard usernameTextfield.text != "" && passwordTextfield.text != "" else {
            return
        }
        
        loginAPI()
    }
    
}
