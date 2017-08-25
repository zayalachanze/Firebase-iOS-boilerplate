//
//  SetLocationViewController.swift
//  Gigster
//
//  Created by Zaya Gooding on 8/3/17.
//  Copyright © 2017 Zaya Gooding. All rights reserved.
//

import UIKit

class SetLocationViewController: UIViewController {
    // Outlets
    @IBOutlet weak var enterZipButton: UIButton!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    override func viewDidLoad() {
        
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
        
        enterZipButton.layer.cornerRadius = 5
    }

    // Check if ZIP is valid before going to next screen
    @IBAction func enterZipButtonPressed(_ sender: Any) {
        if(zipCodeTextField.text?.characters.count != 5) {
            let invalidZipAlert = UIAlertController(title: "Invalid Zip Code", message: "It seems the Zip code you entered is invalid. Please enter a valid, 5-digit Zip code.", preferredStyle: UIAlertControllerStyle.alert)
            invalidZipAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(invalidZipAlert, animated: true, completion: nil)
        } else {
            var zipCode = zipCodeTextField.text
            performSegue(withIdentifier: "segueToInstrumentSelect", sender: nil)
            print("Zip Code entered")
        }
    }
}

