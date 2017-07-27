//
//  LoginViewController.swift
//
//  Created by Mariano Montori on 7/24/17.
//  Copyright © 2017 Mariano Montori. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginStackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        loginStackView.layer.cornerRadius = 10
    
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
            if identifier == "createUser" {
//                dismissKeyboard()
                print("To Create User Screen!")
            }
            if identifier == "forgotPassword" {
//                dismissKeyboard()
                print("To Forget Password Screen!")
            }
        }
    }
    
    @IBAction func unwindToLogin(_ segue: UIStoryboardSegue) {
        print("Returned to Login Screen!")
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        dismissKeyboard()
        guard let email = emailTextField.text,
            let password = passwordTextField.text else{
            return
        }
        AuthService.signIn(controller: self, email: email, password: password) { (user) in
            guard let user = user else {
                print("error: FIRUser does not exist!")
                return
            }
            
            UserService.show(forUID: user.uid) { (user) in
                if let user = user {
                    User.setCurrent(user, writeToUserDefaults: true)
                    let initialViewController = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
                else {
                    print("error: User does not exist!")
                    return
                }
            }
        }
    }
    
    @IBAction func createAccountClicked(_ sender: UIButton) {
        dismissKeyboard()
        performSegue(withIdentifier: "createUser", sender: self)
    }
    
    @IBAction func forgotPasswordClicked(_ sender: UIButton) {
        dismissKeyboard()
        performSegue(withIdentifier: "forgotPassword", sender: self)
    }
}

extension LoginViewController{
    func configureView(){
        applyKeyboardPush()
        applyKeyboardDismisser()
        logInButton.layer.cornerRadius = 10
        createAccountButton.layer.cornerRadius = 10
    }
}
