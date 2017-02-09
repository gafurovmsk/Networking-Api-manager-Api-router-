//
//  alertExtension.swift
//  Magic Mirror
//
//  Created by admin on 17/01/17.
//  Copyright © 2017 Maksim Petrenko. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayAlert(message message: String){
        
        let alert = UIAlertController(title: "Внимание!", message: message, preferredStyle: .Alert)
        let okButton = UIAlertAction(title: "ok!", style: .Default, handler: nil)
        
        
        alert.addAction(okButton)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    
}
