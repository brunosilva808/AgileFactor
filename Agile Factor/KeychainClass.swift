//
//  Keychain.swift
//  Agile Factor
//
//  Created by Bruno Silva on 03/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainService: NSObject {
    
    // Class Methods

    func memberExists() -> Bool {
        if getFromKeychain(key: K.Secure.idKey) != nil {
            return true
        } else {
            return false
        }
    }
    
    func saveMember(member: Member) {
        saveToKeychain(value: (member.username)!, key: K.Secure.usernameKey)
        saveToKeychain(value: String((member.guid)!), key: K.Secure.idKey)
    }
    
    func initMember(member: Member) {
        member.guid = Int(getFromKeychain(key: K.Secure.idKey)!)
        
        if let name = getFromKeychain(key: K.Secure.usernameKey) {
            member.username = name
        }
    }
    
    func saveToKeychain(value: String, key: String) {
        
        guard value != "" else {
            return
        }
        
        let bundleID = Bundle.main.bundleIdentifier
        let keychain: Keychain
        
        if let service = bundleID, !service.isEmpty {
            keychain = Keychain(service: service)
        } else {
            keychain = Keychain()
        }
        
        keychain[key] = value
    }
    
    func getFromKeychain(key: String) -> String? {
        let bundleID = Bundle.main.bundleIdentifier
        let keychain = Keychain(service: bundleID!)
        let token = try? keychain.getString(key)
        
        return token!
    }
    
    
}
