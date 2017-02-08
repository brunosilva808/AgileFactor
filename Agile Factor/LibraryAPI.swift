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

class LibraryAPI {
    
    // Var
    
    private let member: Member
    private let keychain: KeychainClass
    
    // MARK: - Shared Instance
    
    static let sharedInstance = LibraryAPI()
    
    private init() {
        // do your init here
        member = Member()
        keychain = KeychainClass()
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
        let url = URL.baseUrlWith(string: Constants.Api.login(username: username, password: password))
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
            }
            
            DispatchQueue.main.async {
                if  weakSelf?.member.guid == nil {
                    completion(false)
                } else {
                     weakSelf?.keychain.saveToKeychain(value: password, key: kSecValueRef as String)
                    completion(true)
                }
            }
        }
    }
    
    func getMemberBalance(member: Member, completion: @escaping (Member) -> ()) {
        let url = URL.baseUrlWith(string: Constants.Api.balance(username: "leo", password: "password"))
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

    func fetchProductsAlamofire(completion: @escaping ([Product]) -> ()) {
        let url = URL.baseUrlWith(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        Alamofire.request(request).validate().responseJSON { response in
            
            guard response.result.isSuccess else {
                Swift.debugPrint((response.error?.localizedDescription)!)
                return
            }
            
            var products = [Product]()
            
            guard let value = response.result.value as? [[String: AnyObject]] else {
                Swift.debugPrint("Malformed data received from fetchAllRooms service")
                completion(products)
                return
            }
            
            for dictionary in value {
                let product = Product()
                product.title = dictionary["title"] as? String
                product.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                product.points = "1234 points"
                
                let partnerDictionary = dictionary["channel"] as! [String: AnyObject]
                
                let partner = Partner()
                partner.name = partnerDictionary["name"] as? String
                product.partner = partner
                
                products.append(product)
            }
            
            DispatchQueue.main.async {
                completion(products)
            }
        }
    }

    
}
