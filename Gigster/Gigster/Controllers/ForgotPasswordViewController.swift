//
//  ForgotPasswordViewController.swift
//  Firebase-boilerplate
//
//  Created by Mariano Montori on 7/25/17.
//  Copyright © 2017 Mariano Montori. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPasswordStackView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        backButton.layer.cornerRadius = 10
        resetPasswordStackView.layer.cornerRadius = 10
        
        //Gradient
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
    
    @IBAction func resetPasswordClicked(_ sender: UIButton) {
        guard let email = emailTextField.text,
            !email.isEmpty else {
            return
        }
        AuthService.passwordReset(email: email)
    }
}

extension ForgotPasswordViewController{
    func configureView(){
        applyKeyboardPush()
        applyKeyboardDismisser()
    }
}
