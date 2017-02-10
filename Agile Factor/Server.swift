//
//  Server.swift
//  Agile Factor
//
//  Created by Bruno Silva on 03/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class Server: NSObject {
    
    static func initWithURL(service: String, method: String, variables: NSMutableDictionary) -> Bool {
    
        let urlString = K.Api.baseUrl + service + self.buildVariables(variables: variables) + self.defaultVariables(variables: variables)
    
        let url = URL.baseUrlWith(string: urlString)
        var request = URLRequest(url: url)
        request.httpMethod = method
    
        return true
    }
    
    static func defaultVariables(variables: NSMutableDictionary) -> String {
        variables["member_balance_loan"] = "1"
        variables["programId"] = "1"
        variables["member_balance_actual"] = "0"
        variables["languageId"] = "1"
        variables["brandId"] = "1"
        variables["member_balance_available"] = "0"
        variables["channelId"] = "4"
        
        return buildVariables(variables: variables)
    }
    
    static func buildVariables(variables: NSMutableDictionary) -> String{
        
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
    
}

