//
//  K.swift
//  Agile Factor
//
//  Created by Bruno Silva on 12/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import Foundation

struct K {
    
    struct Secure {
        static let passwordKey = "KeyForPassword"
        static let passCodeKey = "KeyForPassCode"
        static let usernameKey = "KeyForUsername"
    }
    
    struct Api {
        static let baseUrl = "http://cjaplsrv:8080/ws_rest/"
        static let login = "credentials?"
        
        static func login(username: String, password: String) -> String {
            return "credentials?member_balance_loan=1&programId=1&member_account_pwd=\(password)&member_account_login=\(username)&member_balance_actual=0&languageId=1&brandId=2&member_balance_available=0&channelId=4"
        }
        
        static func balance(username: String, password: String) -> String {
            return "balance?member_balance_loan=1&programId=1&member_account_pwd=\(password)&member_account_login=\(username)&member_balance_actual=0&languageId=1&brandId=2&member_balance_available=0&channelId=4"
        }
    }
    
}
