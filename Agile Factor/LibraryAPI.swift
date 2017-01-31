//
//  NetworkManager.swift
//  Agile Factor
//
//  Created by Bruno Silva on 10/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import Alamofire

//enum SerializationError: Error {
//    case malformed(String)
//    case invalid(String, Any)
//    case failed(String)
//}
//
//extension SerializationError: CustomStringConvertible {
//    var description: String {
//        switch self {
//        case .malformed:
//            return "Malformed"
//        case .invalid:
//            return self.description
//        case .failed:
//            return self.description
//        }
//    }
//}

// Example

//do {
//    try LibraryAPI.sharedInstance.fetchProductsAlamofire { (products) in
//        self.products = products
//        self.collectionView?.reloadData()
//    }
//} catch let error as SerializationError {
//    print(error.description)
//} catch {
//    print("default")
//}

class LibraryAPI {
    
    // MARK: - Shared Instance
    
    static let sharedInstance = LibraryAPI()
 
    // Methods
    
    func login() {
        Alamofire.request(AgileRouter.login("username","password")).responseJSON { response in
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

    func login(username: String, password: String ,completion: @escaping (Member) -> ()) {
        let url = URL.baseUrlWith(string: Constants.Api.login(username: username, password: password))
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        Alamofire.request(request).validate().responseJSON { response in
            guard response.result.isSuccess else {
                Swift.debugPrint((response.error?.localizedDescription)!)
                return
            }
            
            let member = Member()
            
            if let dictionary = response.result.value as? [String: Any] {
                if let array = dictionary["CREATE"] as? [[String: AnyObject]] {
                    for object in array {
                        member.guid = object["member_eid"] as? Int
                    }
                }
            }
            
            DispatchQueue.main.async {
                completion(member)
            }
        }
    }

    
//    func fetchVideos(completion: @escaping ([Product]) -> ()) {
//        let url = URL(string: Constants.Api.BaseUrl + Constants.Api.Feed)
//        
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            
//            if (error != nil) {
//                Swift.debugPrint((error?.localizedDescription)!)
//                return
//            }
//            
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                
//                var products = [Product]()
//                
//                for dictionary in json as! [[String: AnyObject]] {
//                    
//                    let product = Product()
//                    product.title = dictionary["title"] as? String
//                    product.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//                    product.points = "1234 points"
//                    
//                    let partnerDictionary = dictionary["channel"] as! [String: AnyObject]
//                    
//                    let partner = Partner()
//                    partner.name = partnerDictionary["name"] as? String
//                    product.partner = partner
//                    
//                    products.append(product)
//                }
//                
//                DispatchQueue.main.async {
//                    completion(products)
//                }
//                
//            } catch let jsonError {
//                Swift.debugPrint(jsonError)
//            }
//            
//            }.resume()
//    }

    
}
