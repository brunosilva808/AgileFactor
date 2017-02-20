//
//  PasswordLoginViewController.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

enum Login {
    case firstLogin
    case secondLogin
}

class PasswordLoginViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var pinCodeLabel: UILabel!
    @IBOutlet weak var passwordStackView: UIStackView!
    
    //MARK: - Var
    
    var pinCode = ""
    var numberOfInputs = 0
    
    var passwordContainerView: PasswordContainerView!
    let kPasswordDigit = 4
    var mode = Login.secondLogin
    
    //MARK: - Class Logic
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pinCodeLabel.text = "Enter Pin Code".localized
        
        //create PasswordContainerView
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: kPasswordDigit)
        passwordContainerView.delegate = self
        passwordContainerView.highlightedColor = UIColor.blueSystem()
        passwordContainerView.deleteButton.setTitle("Delete".localized, for: .normal)
    }
    
    //MARK: - Navigation
    
    func presentTabBar() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.presentTabBarViewController()
    }

}

extension PasswordLoginViewController: PasswordInputCompleteProtocol {

    public func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: NSError?) {
        if success {
            self.validationSuccess()
        } else {
            passwordContainerView.clearInput()
        }
    }
    
    public func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        
        if validation(input) {
            numberOfInputs += 1
            
            switch mode {
                case .firstLogin:
                    if numberOfInputs == 2 {
                        self.validationSuccess()
                        self.presentTabBar()
                    } else {
                        pinCodeLabel.text = "Repit Pin Code".localized
                        passwordContainerView.clearInput()
                    }
                case .secondLogin:
                    if numberOfInputs == 1 {
                        self.validationSuccess()
                        self.presentTabBar()
                    } else {
                        pinCodeLabel.text = "Repit Pin Code".localized
                        passwordContainerView.clearInput()
                    }
            }
        } else {
            validationFail()
        }
    }
  
}

private extension PasswordLoginViewController {
    func validation(_ input: String) -> Bool {
        
        if pinCode.characters.count == 0 {
            pinCode = input
            return true
        } else {
            return input == pinCode
        }
    }
    
    func validationSuccess() {
        print("*️⃣ success!")
        dismiss(animated: true, completion: nil)
    }
    
    func validationFail() {
        print("*️⃣ failure!")
        passwordContainerView.wrongPassword()
    }
}
