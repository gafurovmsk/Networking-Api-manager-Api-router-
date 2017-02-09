//
//  AuthViewController.swift
//  Magic Mirror
//
//  Created by Maksim Petrenko on 10.08.16.
//  Copyright © 2016 Maksim Petrenko. All rights reserved.
//  refactored Gafurov Z

import UIKit
import Alamofire
import SwiftyJSON
import VK_ios_sdk


class AuthViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate  {
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    lazy var registrationVC = (UIStoryboard(name: "Signin+Selfie", bundle: nil).instantiateInitialViewController() as? RegistrationViewController)
    
    let manager = APIManager.sharedInstance
    let profile = Profile.sharedInstance
  
    let phoneLength = 6
    let passwordLength = 6
    
    let vkAppId = "5853988"
    
    
    @IBAction func sendButtonPressed(sender: UIButton) {
        
        
        //        Interactive fields checking
        //        phoneField.addTarget(self, action: #selector(self.textFieldDidChanged), forControlEvents: UIControlEvents.EditingDidEnd)
        //
        
        let pass = passwordField.text
        let phone = phoneField.text
        
        
        switch(phone,pass) {
        case (nil,_):
            self.displayAlert(message: StateMessage.emptyLoginField.out)
        case(_,nil):
            self.displayAlert(message: StateMessage.emptyPasswordField.out)
        case let (pass,phone) where (pass?.characters.count)! < passwordLength || (phone?.characters.count)! < phoneLength :
            self.displayAlert(message: StateMessage.shortLogin.out)
        default:
            
            EZLoadingActivity.show(StateMessage.wait.out, disableUI: true)
            manager.loginWithBasicAuth(phone!, password: pass!){
                result in
                
                let json = JSON(data: result)
                
                
                if json["data"]["LOGIN"].exists() {
                    
                    self.profile.id  = json["data"]["ID"].stringValue
                    self.profile.login = json["data"]["LOGIN"].stringValue
                    self.profile.checkWord = json["data"]["CHECKWORD"].stringValue
                    self.profile.name = json["data"]["NAME"].stringValue
                    self.profile.secondName = json["data"]["SECOND_NAME"].stringValue
                    self.profile.lastName = json["data"]["LAST_NAME"].stringValue
                    self.profile.email = json["data"]["EMAIL"].stringValue
                    
                    EZLoadingActivity.hide()
                    
                    let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    let tbc = delegate.tabBarController
                    self.navigationController?.pushViewController(tbc, animated: true)
                    
                } else {
                    
                    self.displayAlert(message: "Неправильно введен Логин/Пароль! Повторите вход!")
                    EZLoadingActivity.hide()
                }
                
            }
        }
        
        
    }
    

    
    @IBAction func showRegistration() {
        
        navigationController?.pushViewController(registrationVC!, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         let sdkInstance = VKSdk.initializeWithAppId(self.vkAppId)
         sdkInstance.registerDelegate(self);
         sdkInstance.uiDelegate = self;
        
       
        addKeyboardHideGestures()
    }
    
    
    func textFieldDidChanged(){
        
        if phoneField.text == nil {
            self.sendButton.enabled = false
            self.displayAlert(message: StateMessage.emptyLoginField.out)
        } else {
            self.sendButton.enabled = true
        }
    }
    
    
    func vkSdkAccessAuthorizationFinishedWithResult(result:VKAuthorizationResult?) -> Void {
    
    }
    
    func vkSdkUserAuthorizationFailed() -> Void {
        
    }
    
    func vkSdkAccessTokenUpdated(newToken:VKAccessToken?, oldToken:VKAccessToken?) -> Void {
        
    }
    
    func vkSdkAuthorizationStateUpdatedWithResult(result:VKAuthorizationResult) -> Void {
        
    }
    
    func vkSdkShouldPresentViewController(controller:UIViewController?) -> Void {
        
    }
    
    func vkSdkNeedCaptchaEnter(captchaError:VKError?) -> Void {
        
    }
    
    
}



