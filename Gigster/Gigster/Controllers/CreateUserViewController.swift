//
//  CreateUserViewController.swift
//  Firebase-boilerplate
//
//  Created by Mariano Montori on 7/24/17.
//  Copyright © 2017 Mariano Montori. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateUserViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var createAccountStackView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        backButton.layer.cornerRadius = 10
        createAccountStackView.layer.cornerRadius = 10
        
        // Gradient
        let topColor = UIColor(red: (93/255.5), green: (180/255.5), blue: (87/255.5), alpha: 1.0)
        let bottomColor = UIColor(red: (72/255.5), green: (134/255.5), blue: (73/255.5), alpha: 1.0)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0/1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Back to Login screen!")
            }
        }
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let username = usernameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            !username.isEmpty,
            !firstName.isEmpty,
            !lastName.isEmpty
            else {
                print("Required fields are not all filled!")
                return
            }
        
        AuthService.createUser(controller: self, email: email, password: password) { (authUser) in
            guard let firUser = authUser else {
                return
            }
            
            UserService.create(firUser, username: username, firstName: firstName, lastName: lastName) { (user) in
                guard let user = user else {
                    return
                }
                
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}

extension CreateUserViewController{
    func configureView(){
        applyKeyboardPush()
        applyKeyboardDismisser()
        signUpButton.layer.cornerRadius = 10
    }
}
