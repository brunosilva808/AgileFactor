//
//  PasswordLoginViewController.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

class PasswordLoginViewController: UIViewController {

    @IBOutlet weak var pinCodeLabel: UILabel!
    @IBOutlet weak var passwordStackView: UIStackView!
    
    //MARK: Property
    var passwordContainerView: PasswordContainerView!
    let kPasswordDigit = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinCodeLabel.text = "Enter Pin Code".localized
        
        //create PasswordContainerView
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: kPasswordDigit)
        passwordContainerView.delegate = self
        passwordContainerView.highlightedColor = UIColor.blueSystem()
        passwordContainerView.deleteButton.setTitle("Delete".localized, for: .normal)
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
            validationSuccess()
        } else {
            validationFail()
        }
    }
  
}

private extension PasswordLoginViewController {
    func validation(_ input: String) -> Bool {
        return input == "1234"
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
