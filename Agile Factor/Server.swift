//
//  Server.swift
//  Agile Factor
//
//  Created by Bruno Silva on 03/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class Server: NSObject {
    
    static func initWithURL(service: String, method: String, parameters: NSMutableDictionary) -> URLRequest {
        
        let parametersString = self.buildparameters(parameters: parameters)
        let url = URL.baseUrlWith(service: service, parameters: parametersString)
        var request = URLRequest(url: url)
        request.httpMethod = method
    
        return request
    }
    
    static func addDefaultparameters(parameters: NSMutableDictionary) -> NSMutableDictionary {
        parameters["member_balance_loan"] = "1"
        parameters["programId"] = "1"
        parameters["member_balance_actual"] = "0"
        parameters["languageId"] = "1"
        parameters["brandId"] = "2"
        parameters["member_balance_available"] = "0"
        parameters["channelId"] = "4"
        
        return parameters
    }
        
    static func buildparameters(parameters: NSMutableDictionary) -> String{
        
        let parametersTmp = addDefaultparameters(parameters: parameters)
        var path = ""
        
        let enumerator = parametersTmp.keyEnumerator()
        while let key = enumerator.nextObject() {
            
            if path.characters.count > 0 {
                path += "&"
            }
            
            if let field = parametersTmp[key] {
                path += "\(key)=" + "\(field)"
            } else {
                path += "\(key)=" + ""
            }
        }
        
        return path
    }
    
}

