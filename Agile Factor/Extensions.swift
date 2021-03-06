//
//  Extensions.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func alertView(title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle:  UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default)
        alert.addAction(okAction)
        
        return alert
    }
}

extension UIColor {

    static func lightGraySystem() -> UIColor{
        return UIColor.rgb(red: 225, green: 225, blue: 225, alpha: 1)
    }
    
    static func blueSystem() -> UIColor{
        return UIColor.rgb(red: 0, green: 122, blue: 255, alpha: 1)
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension URLRequest {
    static func requestGET(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
    
    static func requestPOST(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        return request
    }
}

extension URL {
    
    static func baseUrlWith(service: String, parameters: String) -> URL {
        return URL(string: K.Api.baseUrl + service + parameters)!
    }
    
    static func baseUrlWith(string: String) -> URL {
        return URL(string: K.Api.baseUrl + string)!
    }
}
