//
//  APIRouter.swift
//  Magic Mirror
//
//  Created by Gafurov Z.
//  
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    static let baseURLString = "http://magicmirror.techmas.ru/app/user/"
    
    case Login(String, String)
    case Register(String, String, String, String)
    case isLogged(String)
    case ChangeProfile(String, String, String, String)
    case Logout()
    
    var URLRequest: NSMutableURLRequest {
        
        var method: Alamofire.Method {
            switch self {
            case .Login, .Logout, .isLogged, .Register, .ChangeProfile:
                return .GET
            }
        }
        
        let params: ([String: AnyObject]?) = {
            switch self {
            case .Login, .Logout, .isLogged, .Register, .ChangeProfile:
                return nil
            }
        }()
        
        let url: NSURL = {
            // build up and return the URL for each endpoint
            let addComponent: String?
            
            switch self {
            case .Login(let login, let password):
                addComponent = "author/?login=\(login)&password=\(password)"
            case .Logout():
                addComponent = "logout/" //?login=\(login)&password=\(password)"
            case .Register(let login, let password, let name, let email):
                addComponent = "reg/?phone=\(login)&password=\(password)&email=\(email)&name=\(name)"
            case .isLogged(let checkw):
                addComponent = "is_logged/?checkword=\(checkw)"
            case .ChangeProfile(let password, let name, let city, let country):
                addComponent = "user_date/&password=\(password)&name=\(name)&city=\(city)&country=\(country)"
            }
            
            
            let newComp = addComponent?.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            
            let URL = NSURL(string: APIRouter.baseURLString + newComp!)!
            
            return URL
        }()
        
        let URLRequest = NSMutableURLRequest(URL: url)
        //print(" -> URLRequest = \(URLRequest)")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        let (encodedRequest, _) = encoding.encode(URLRequest, parameters: params)
        
        encodedRequest.HTTPMethod = method.rawValue
        
        return encodedRequest
    }
}
