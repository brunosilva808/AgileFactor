//
//  NetworkManager.swift
//  Agile Factor
//
//  Created by Bruno Silva on 10/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import Alamofire
import KeychainAccess

class API: Server {
    
    // Var
    
    private let member: Member
    private var password: String
    private let keychain: KeychainService
    
    // MARK: - Shared Instance
    
    static let sharedInstance = API()
    
    private override init() {
        member = Member()
        keychain = KeychainService()
        password = ""
    }
    
    func validateJSON(response: DataResponse<Any>) -> (success: Bool, dict: [String: Any]) {
        let dictEmpty = [String: Any]()
        
        guard response.result.isSuccess else {
            Swift.debugPrint((response.error?.localizedDescription)!)
            return (false, dictEmpty)
        }
        
        guard let dict = response.result.value as? [String: Any] else {
            Swift.debugPrint("JSON Tags malformated!")
            return (false, dictEmpty)
        }
        
        return (true, dict)
    }
    
    // Class Methods
    
//    func login(username: String, password: String ,completion: @escaping (Bool) -> ()) {
//        let url = URL.baseUrlWith(string: K.Api.login(username: username, password: password))
//        let request = URLRequest.requestGET(url: url)
//        
//        weak var weakSelf = self
//        
//        Alamofire.request(request).validate().responseJSON { response in
//
//            let answer =  weakSelf?.validateJSON(response: response)
//            
//            guard answer?.success == true else {
//                return
//            }
//            
//            guard let array = answer?.dict["CREATE"] as? [[String: AnyObject]] else {
//                Swift.debugPrint("Wrong JSON Tags!")
//                return
//            }
//
//            for object in array {
//                weakSelf?.member.guid = object["member_eid"] as? Int
//                weakSelf?.member.username = username
//                weakSelf?.password = password
//            }
//            
//            DispatchQueue.main.async {
//                if  weakSelf?.member.guid == nil {
//                    completion(false)
//                } else {
//                     weakSelf?.keychain.saveToKeychain(value: password, key: K.Secure.passwordKey)
//                    completion(true)
//                }
//            }
//        }
//    }
    
    func login(username: String, password: String ,completion: @escaping (Bool) -> ()) {
        var parameters = NSMutableDictionary()
        parameters = ["member_account_pwd"   : password,
                      "member_account_login" : username]
        
        let request = Server.initWithURL(service: K.Api.login, method: K.RequestMethod.GET, parameters: parameters)
        
        weak var weakSelf = self
        
        Alamofire.request(request).validate().responseJSON { response in
            
            let answer =  weakSelf?.validateJSON(response: response)
            
            guard answer?.success == true else {
                return
            }
            
            guard let array = answer?.dict["CREATE"] as? [[String: AnyObject]] else {
                Swift.debugPrint("Wrong JSON Tags!")
                return
            }
            
            for object in array {
                weakSelf?.member.guid = object["member_eid"] as? Int
                weakSelf?.member.username = username
                weakSelf?.password = password
            }
            
            DispatchQueue.main.async {
                if  weakSelf?.member.guid == nil {
                    completion(false)
                } else {
                    weakSelf?.keychain.saveToKeychain(value: password, key: K.Secure.passwordKey)
                    completion(true)
                }
            }
        }

    }
    
    func memberBalance(completion: @escaping (Member) -> ()) {
        var parameters = NSMutableDictionary()
        parameters = ["member_account_pwd"   : self.password,
                      "member_account_login" : self.member.username!]
        
        let request = Server.initWithURL(service: K.Api.balance, method: K.RequestMethod.GET, parameters: parameters)
        
        weak var weakSelf = self
        
        Alamofire.request(request).validate().responseJSON { response in
            
            let answer = weakSelf?.validateJSON(response: response)
            
            guard answer?.success == true else {
                return
            }
            
            guard let members = answer?.dict["CREATE"] as? [[String: Any]] else {
                Swift.debugPrint("Wrong JSON Tags!")
                return
            }
            
            for user in members {
                if user["actual_balance"] as? String != nil {
                    weakSelf?.member.balance?.actualPoints = user["actual_balance"] as! String?
                }
            }
            
            DispatchQueue.main.async {
                completion((weakSelf?.member)!)
            }
        }
    }
    
}
