//
//  FG_RedemptionCollectionCVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 13/03/23.
//

import UIKit

class FG_RedemptionCollectionCVC: UICollectionViewCell {
    
    @IBOutlet var collectionDataLbl: UILabel!
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected{
                collectionDataLbl.textColor = isSelected ? .white : .white
                collectionDataLbl.backgroundColor = isSelected ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                collectionDataLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                collectionDataLbl.textColor = .black
            }
        }
    }
    
    
}
