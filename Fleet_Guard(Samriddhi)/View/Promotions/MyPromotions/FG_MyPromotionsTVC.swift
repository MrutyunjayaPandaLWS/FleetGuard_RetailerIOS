//
//  FG_MyPromotionsTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

protocol SendOffersDetailsDelegate {
    func sendOffersDetails(_ cell: FG_MyPromotionsTVC)
}

class FG_MyPromotionsTVC: UITableViewCell {

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var priceValueLbl: UILabel!
    @IBOutlet weak var promotionTitleLbl: UILabel!
    @IBOutlet weak var promotionImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var viewText: UILabel!
    
    var delegate: SendOffersDetailsDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        localization()
        self.selectionStyle = .none
        self.subView.clipsToBounds = true
        self.subView.layer.cornerRadius = 16
        self.subView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    
    }
    
    private func localization(){
        viewText.text = "View".localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func viewBtn(_ sender: Any) {
        self.delegate.sendOffersDetails(self)
    }
}
