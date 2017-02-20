//
//  Member.swift
//  Agile Factor
//
//  Created by Bruno Silva on 11/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class Member: NSObject {
    var guid: Int?
    var username: String?
    var balance: Balance?

    override var description: String {
        
        guard let guid = self.guid else {
            return "Member id is null"
        }
        
        return  "id: \(guid)" +
                "name: \(self.username!)" +
                "balance: \(self.balance)"
    }
    
}
