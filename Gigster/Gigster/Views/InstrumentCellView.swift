//
//  InstrumentCell.swift
//  Gigster
//
//  Created by Zaya Gooding on 8/10/17.
//  Copyright © 2017 Zaya Gooding. All rights reserved.
//

import UIKit

class InstrumentCell: UICollectionViewCell {
    
    @IBOutlet weak var instrumentLabel: UILabel!
    static var isSelected = Bool()
    
    func changeColorWhenSelected() {
        if InstrumentCell.isSelected == true {
            instrumentLabel.textColor = UIColor(red: 250/255.5, green: 250/255.5, blue: 250/255.5, alpha: 1.0)
        }
    }
}
