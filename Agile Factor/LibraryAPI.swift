//
//  NetworkManager.swift
//  Agile Factor
//
//  Created by Bruno Silva on 10/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import Alamofire

class LibraryAPI {
    
    // MARK: - Shared Instance
    
    static let sharedInstance = LibraryAPI()
 
    // Methods
    
    func login() {
//        Alamofire.request(Constants.AgileFactorApi.BaseUrl).responseJSON { response in
//            if let error = response.result.error {
//                // got an error while deleting, need to handle it
//                print("error calling DELETE on /posts/1")
//                print(error)
//            }
//        }
        
        Alamofire.request(AgileRouter.login("username","password")).responseJSON { response in
            
        }
        
    }

    
    func baseUrlWith(string: String) -> URL {
        let url: URL = URL(string: Constants.Api.BaseUrl + string)!
        return url
//        return String(Constants.Api.BaseUrl + Constants.Api.Feed)
    }
    
    func fetchVideosAlamofire(completion: @escaping ([Product]) -> ()) {
        let url = URL(string: Constants.Api.BaseUrl + Constants.Api.Feed)
        let url1 = baseUrlWith(string: Constants.Api.Feed)
        
        var request = URLRequest(url: url1)
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
        
//        Alamofire.request(url!,
//                          method: .get,
//                          parameters: nil).validate().responseJSON { response in
//                        
//            guard response.result.isSuccess else {
//                Swift.debugPrint((response.error?.localizedDescription)!)
//                return
//            }
//                            
//            var products = [Product]()
//             
//            guard let value = response.result.value as? [[String: AnyObject]] else {
//                Swift.debugPrint("Malformed data received from fetchAllRooms service")
//                completion(products)
//                return
//            }
//            
//            for dictionary in value {
//                
//                let product = Product()
//                product.title = dictionary["title"] as? String
//                product.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//                product.points = "1234 points"
//                
//                let partnerDictionary = dictionary["channel"] as! [String: AnyObject]
//                
//                let partner = Partner()
//                partner.name = partnerDictionary["name"] as? String
//                product.partner = partner
//                
//                products.append(product)
//            }
//            
//            DispatchQueue.main.async {
//                completion(products)
//            }
//        }
    }
    
    func fetchVideos(completion: @escaping ([Product]) -> ()) {
        let url = URL(string: Constants.Api.BaseUrl + Constants.Api.Feed)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if (error != nil) {
                Swift.debugPrint((error?.localizedDescription)!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var products = [Product]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
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
                
            } catch let jsonError {
                Swift.debugPrint(jsonError)
            }
            
            }.resume()
    }

    
}
