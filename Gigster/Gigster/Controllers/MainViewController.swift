//
//  MainViewController.swift
//  Firebase-boilerplate
//
//  Created by Mariano Montori on 7/24/17.
//  Copyright © 2017 Mariano Montori. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    var authHandle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileNavigationBar: UINavigationBar!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(User.current.firstName) \(User.current.lastName)"
        usernameLabel.text = User.current.username
            
        authHandle = AuthService.authListener(viewController: self)
        
        profileImage.layer.cornerRadius = 45
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        AuthService.removeAuthListener(authHandle: authHandle)
    }
    
    @IBAction func unwindToProfile(_ segue: UIStoryboardSegue) {
    }
}
