//
//  ViewController+Utility.swift
//  Firebase-boilerplate
//
//  Created by Mariano Montori on 7/24/17.
//  Copyright © 2017 Mariano Montori. All rights reserved.
//
import Foundation
import UIKit

extension UIViewController {
    class Keyboard {
        static var pushValue : CGFloat = 0
    }
    
    func applyKeyboardPush(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        view.alpha = 0.9
        view.backgroundColor = UIColor.gray
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
                Keyboard.pushValue = keyboardSize.height
                print(Keyboard.pushValue)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        view.alpha = 1
        view.backgroundColor = UIColor.white
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += Keyboard.pushValue
                print(Keyboard.pushValue)
            }
        }
    }
    
    func applyKeyboardDismisser(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
}
