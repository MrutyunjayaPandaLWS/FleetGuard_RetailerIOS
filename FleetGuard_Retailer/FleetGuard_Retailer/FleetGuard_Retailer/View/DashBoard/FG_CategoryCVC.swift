//
//  FG_CategoryCVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_CategoryCVC: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override var isSelected: Bool {
        didSet {
//            if isSelected{
//                titleLbl.textColor = isSelected ? .white : .white
//                titleLbl.backgroundColor = isSelected ? #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 0.32) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                titleLbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
//                //titleLbl.borderColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.007843137255, alpha: 0.32)
//                //titleLbl.borderWidth = 1
//            }else{
//                titleLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                //titleLbl.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//                titleLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//                //titleLbl.borderWidth = 1
//            }
        }
    }
    
    
}
    
