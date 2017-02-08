//
//  Balance.swift
//  Agile Factor
//
//  Created by Bruno Silva on 02/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import Foundation

class Balance: NSObject {
    var actualPoints: String?
    
    override var description: String {
        
        guard let actualPoints = self.actualPoints else {
            return "No actual points"
        }
        
        return  "Actual points: \(actualPoints)\n"
    }
}
