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

class API {
    
    // Var
    
    private let member: Member
    private var password: String
    private let keychain: KeychainService
    
    // MARK: - Shared Instance
    
    static let sharedInstance = API()
    
    private init() {
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
    
    func login(username: String, password: String ,completion: @escaping (Bool) -> ()) {
        let url = URL.baseUrlWith(string: K.Api.login(username: username, password: password))
        let request = URLRequest.requestGET(url: url)
        
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
            
            weakSelf?.credentials()
            
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
    
    func credentials() {
        var variables = NSMutableDictionary()
        variables = ["member_account_pwd"   : self.password,
                     "member_account_login" : self.member.username!]
        
        Swift.debugPrint(initWithURL(service: K.Api.login, method: "GET", variables: variables))
    }
    
    func initWithURL(service: String, method: String, variables: NSMutableDictionary) -> Bool {
        
        let urlString = K.Api.baseUrl + service + self.buildVariables(variables: variables) + self.defaultVariables(variables: variables)
        
        let url = URL.baseUrlWith(string: urlString)
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        return true
        
    }
    
    func defaultVariables(variables: NSMutableDictionary) -> String {
        variables["member_balance_loan"] = "1"
        variables["programId"] = "1"
        variables["member_balance_actual"] = "0"
        variables["languageId"] = "1"
        variables["brandId"] = "1"
        variables["member_balance_available"] = "0"
        variables["channelId"] = "4"
        
        return buildVariables(variables: variables)
    }
    
    func buildVariables(variables: NSMutableDictionary) -> String{
        
        var path = ""

        let enumerator = variables.keyEnumerator()
        while let key = enumerator.nextObject() {
            
            if path.characters.count > 0 {
                path += "&"
            }

            if let field = variables[key] {
                path += "\(key)=" + "\(field)"
            } else {
                path += "\(key)=" + ""
            }
        }
        
        return path
    }
    
    
    func memberBalance(member: Member, completion: @escaping (Member) -> ()) {
        let url = URL.baseUrlWith(string: K.Api.balance(username: member.username!, password: self.password))
        let request = URLRequest.requestGET(url: url)
        
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
            
            let member = Member()
            
            for user in members {
                if user["actual_balance"] as? String != nil {
                    weakSelf?.member.balance?.actualPoints = user["actual_balance"] as! String?
                }
            }
            
            DispatchQueue.main.async {
                completion(member)
            }
        }
    }
    
}
