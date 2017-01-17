//
//  PostRouter.swift
//  grokRouter
//
//  Created by Christina Moulton on 2016-04-01.
//  Copyright © 2016 Teak Mobile Inc. All rights reserved.
//

import Foundation
import Alamofire

public enum AgileRouter: URLRequestConvertible {
    static let baseURLString = "https://jsonplaceholder.typicode.com/"
    
    case login(String, String)
    case get(Int)
    case create([String: Any])
    case delete(Int)
    
    public func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .get, .login:
                return .get
            case .create:
                return .post
            case .delete:
                return .delete
            }
        }
        let params: ([String: Any]?) = {
            switch self {
            case .get, .delete, .login:
                return nil
            case .create(let newTodo):
                return (newTodo)
            }
        }()
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .login(let username, let password):
                relativePath = "todos/\(username)/\(password)"
            case .get(let number):
                relativePath = "todos/\(number)"
            case .create:
                relativePath = "todos"
            case .delete(let number):
                relativePath = "todos/\(number)"
            }
            var url = URL(string: AgileRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}
