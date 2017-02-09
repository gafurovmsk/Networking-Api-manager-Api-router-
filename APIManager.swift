//
//  APIManager.swift
//  Magic Mirror
//
//  Created by Gafurov Z.
//
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    static let sharedInstance = APIManager()
  
    func loginWithBasicAuth(login: String, password pass: String,handler: NSData -> Void) {
        Alamofire.request(APIRouter.Login(login, pass))
            .validate()
            .responseJSON { [weak self] response in
                switch response.result {
                case .Success :
                    print(response.description)
                    handler(response.data!)
                    
                case .Failure :
                    print(response.result.error)
                }
        }
    }
    
    func registerUser(login: String, password pass: String, name nam: String, email mail: String = "test@mm.ru", handler: NSData -> Void) {
        Alamofire.request(APIRouter.Register(login, pass, nam, mail))
            .validate()
            .responseJSON{ [weak self] response in
                
                switch response.result {
                case .Success :
                    print (response.description)
                    handler(response.data!)
                    
                case .Failure :
                    print (response.result.error)
                }
        }
    }
    
    
    func isLogged( withCheckword checkw: String, handler: NSData -> Void) {
        
        Alamofire.request(APIRouter.isLogged(checkw))
            .validate()
          .responseJSON(completionHandler: {[weak self] response in
                
                switch response.result {
                case .Success:
                  
                    print (response.description)
                    handler (response.data!)
                case .Failure:
                    print(response.result.error)
                }
            })
        
        
    }
    
    
    func changeUserProfile(pass: String, name nam: String, city cty: String, country contry: String) {
        Alamofire.request(APIRouter.ChangeProfile(pass, nam, cty, contry))
            .responseString { response in
                guard let receivedString = response.result.value else {
                    print("didn't get a string in the responce")
                    return
                }
                print(receivedString)
        }
    }
    
    func logOut() {
        Alamofire.request(APIRouter.Logout())
            .responseString { response in
                guard let receivedString = response.result.value else {
                    print("didn't get a string in the responce")
                    return
                }
                print(receivedString)
        }
    }
    
    
    
    
  
    //MARK: image processing
    
    func getSizedJPGData(image image: UIImage) -> NSData? {
        
        /*
         if max(image.size.height, image.size.width) > 300 {
         let scaledImage = image.af_imageScaled(to: CGSize(width: 300, height: 300))
         return UIImageJPEGRepresentation(scaledImage, 0.6)
         }*/
        
        return UIImageJPEGRepresentation(image, 0.6)
    }
    
    func uploadImage(image: UIImage, completion:((JSON)->())? = nil) {
        guard let imageData = self.getSizedJPGData(image: image) else {
            return
        }
        
        let urlString = "http://104.131.124.131/api/face.php"
        
        Alamofire.upload(.POST, urlString, multipartFormData: { (multipartFormData) in
            
            multipartFormData.appendBodyPart(data: imageData, name: "file", fileName: "image.jpg", mimeType: "image/jpeg")
            
        }) { encodingResult in
            switch encodingResult {
            case .Success(let upload, _, _):
                upload.responseData { response in
                    
                    let swJSON = JSON(data: response.data!)
                    
                    if let jsonString = swJSON.rawString() {
                        print(" response: \n", jsonString)
                    }
                    
                    completion?(swJSON)
                }
            case .Failure(_):
                break
            }
        }
    }
}
