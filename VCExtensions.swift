//
//  VCExtensions.swift
//  Magic Mirror
//
//  Created by Nik on 18/01/17.
//  Copyright © 2017 Gafurov Z. All rights reserved.
//

import UIKit


extension UIViewController {
  
    func addKeyboardHideGestures() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        swipeDownGesture.direction = UISwipeGestureRecognizerDirection.Down
        swipeDownGesture.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(swipeDownGesture)
    }
    
    func addDoneButtonOnKeyboard(forTextField textField: UITextField) {
        
        let doneToolbar:UIToolbar = UIToolbar()
        doneToolbar.barTintColor = UIColor.whiteColor()
        doneToolbar.translucent = false
        doneToolbar.tintColor = UIColor(red: 97.0/255.0, green: 199.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        doneToolbar.items=[
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: NSLocalizedString("Done", comment: "confirmation done"), style: .Done, target: self, action: #selector(UIViewController.dismissKeyboard))
        ]
        
        doneToolbar.sizeToFit()
        textField.inputAccessoryView = doneToolbar
        
        
        self.toolbarItems? = doneToolbar.items!
        self.navigationController?.toolbarHidden = false
    }
    
    func dismissKeyboard() {
        self.navigationController?.toolbarHidden = true
        self.view.endEditing(true)
    }
    
    func addNextButtonOnKeyboard(forTextField textField: UITextField) {
        
        let nextToolbar:UIToolbar = UIToolbar()
        nextToolbar.barTintColor = UIColor.whiteColor()
        nextToolbar.translucent = false
        nextToolbar.tintColor = UIColor(red: 97.0/255.0, green: 199.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        nextToolbar.items=[
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: NSLocalizedString("Next", comment: "common controls Next button"), style: .Done, target: self, action: #selector(UIViewController.shouldTextFieldReturnDelegate))
        ]
        
        nextToolbar.sizeToFit()
        textField.inputAccessoryView = nextToolbar
        
    }
    
    func shouldTextFieldReturnDelegate() {
        
        if let textField = self.view.resignFirstResponder() as? UITextField {
            
            let result = textField.delegate?.textFieldShouldReturn?(textField)
            if result == nil || result == true {
                textField.sendActionsForControlEvents(.EditingDidEndOnExit)
            }
            
        }
    }
    
    
}
