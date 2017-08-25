//
//  SelectInstrumentsViewController.swift
//  Gigster
//
//  Created by Zaya Gooding on 8/10/17.
//  Copyright © 2017 Zaya Gooding. All rights reserved.
//

import UIKit

final class SelectInstrumentsViewController: UICollectionViewController {

    fileprivate let itemsPerRow: CGFloat = 3
    
    @IBAction func selectInstrumentsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SegueToMainApp", sender: nil)
    }
    
    
    // MARK: - Properties (Collection View)
    var selectedInstruments = [String]()
    fileprivate let reuseIdentifier = "InstrumentCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    
    let instrumentList = ["Vocals", "Acoustic Guitar", "Electric Guitar", "Piano", "Keyboard", "Bass Guitar", "Drums", "Ukulele", "Violin", "Viola", "Cello", "String/Upright Bass", "Saxophone", "Trumpet", "Trombone", "Tuba", "Oboe", "Flute", "Clarinet", "Organ", "Harp", "Xylophone", "Banjo", "Accordion", "Melodica", "Synth", "DJ/Midi"]
    
     override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "InstrumentCollectionHeaderView", for: indexPath) as! InstrumentCollectionHeaderView
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    

}

// MARK: - UICollectionViewDataSource
extension SelectInstrumentsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return instrumentList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedInstruments.contains(instrumentList[indexPath.row]) {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(red: 250/255.5, green: 250/255.5, blue: 250/255.5, alpha: 1.0)
            selectedInstruments.remove(at: selectedInstruments.index(of: instrumentList[indexPath.row])!)
        } else {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(red: (93/255.5), green: (180/255.5), blue: (87/255.5), alpha: 1.0)
            selectedInstruments.append(instrumentList[indexPath.row])
            
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InstrumentCell
        cell.backgroundColor = UIColor(red: 250/255.5, green: 250/255.5, blue: 250/255.5, alpha: 1.0)
        cell.instrumentLabel.text = instrumentList[indexPath.row]

        // Configure the cell
        return cell
    }
}

extension SelectInstrumentsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
