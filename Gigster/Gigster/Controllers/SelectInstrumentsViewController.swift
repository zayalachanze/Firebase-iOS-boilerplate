//
//  SelectInstrumentsViewController.swift
//  Gigster
//
//  Created by Zaya Gooding on 8/10/17.
//  Copyright © 2017 Zaya Gooding. All rights reserved.
//

import UIKit

final class SelectInstrumentsViewController: UICollectionViewController {
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "InstrumentCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    let instrumentList = ["Vocals", "Acoustic Guitar", "Electric Guitar", "Piano", "Keyboard", "Bass Guitar", "Drums", "Ukulele", "Violin", "Viola", "Cello", "String/Upright Bass", "Saxophone", "Trumpet", "Trombone", "Tuba", "Oboe", "Flute", "Clarinet", "Organ", "Harp", "Xylophone", "Banjo", "Accordion", "Melodica", "Synth", "DJ/Midi"]
}

// MARK: - UICollectionViewDataSource
extension SelectInstrumentsViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return instrumentList.count
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return instrumentList.count
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
        cell.backgroundColor = UIColor.black
        // Configure the cell
        return cell
    }
}
