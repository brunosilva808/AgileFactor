//
//  Localizator.swift
//  Agile Factor
//
//  Created by Bruno Silva on 31/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return Localizator.sharedInstance.localize(string: self)
    }
}

private class Localizator {
    
    static let sharedInstance = Localizator()
    
    lazy var localizableDictionary: NSDictionary! = {
        if let path = Bundle.main.path(forResource: "Localizable", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        fatalError("Localizable file NOT found")
    }()
    
    func localize(string: String) -> String {
        guard let localizedString = (localizableDictionary.value(forKey: string) as AnyObject).value(forKey: "value") as? String else {
            assertionFailure("Missing translation for: \(string)")
            return ""
        }
        return localizedString
    }
}
