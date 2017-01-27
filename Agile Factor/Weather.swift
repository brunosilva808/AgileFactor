//
//  Weather.swift
//  AgileDemo
//
//  Created by Bruno Silva on 18/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

extension Weather {
    init?(json: [String: Any]) {
        guard
            let id = json["id"] as? Int,
            let main = json["main"] as? String,
            let description = json["description"] as? String,
            let icon = json["icon"] as? String
            else { return nil }
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

enum JSONParseError: Error {
    case notADictionary
    case missingWeatherObjects
}

var jsonStr = "{\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04d\"}],}"

class Xpto: NSObject {

    func name() {
        let data = jsonStr.data(using: String.Encoding.ascii, allowLossyConversion: false)
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: [])
            guard let dict = json as? [String: Any] else{
                throw JSONParseError.notADictionary
            }
            
            guard let weatherJSON = dict["weather"] as? [[String: Any]] else {
                throw JSONParseError.missingWeatherObjects
            }
            
            let weather = weatherJSON.flatMap(Weather.init)
            print(weather)
        }
        catch {
            print(error)
        }
    }
    
}
