//
//  Member.swift
//  Agile Factor
//
//  Created by Bruno Silva on 11/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

class Member: NSObject {
    var guid: String!
    var name: String?
    
    init(guid: String, name: String) {
        super.init()
        self.guid = guid
        self.name = name
    }
    
    override var description: String {
        return  "id: \(guid)" +
                "name: \(name)"
    }
    
}
