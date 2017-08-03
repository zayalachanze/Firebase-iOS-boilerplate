//
//  SettingsViewController.swift
//  Gigster
//
//  Created by Zaya Gooding on 7/28/17.
//  Copyright © 2017 Zaya Gooding. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBAction func logOut(_ sender: Any) {
        AuthService.presentLogOut(viewController: self)
        
    }
    
    @IBAction func deleteAccount(_ sender: Any) {
        guard let user = Auth.auth().currentUser else {
            print("NO USER EXISTS???")
            return
        }
        AuthService.presentDelete(viewController: self, user : user)
    }
}
