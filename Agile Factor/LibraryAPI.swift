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
    
    func fetchVideos(completion: @escaping ([Product]) -> ()) {
        let url = URL(string: Constants.AgileFactorApi.BaseUrl + Constants.AgileFactorApi.Feed)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if (error != nil) {
                print((error?.localizedDescription)!)
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
                print(jsonError)
            }
            
            }.resume()
    }

    
}
