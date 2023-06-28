//
//  FG_RedemptionCatalogueTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 23/01/2023.
//

import UIKit
import LanguageManager_iOS

protocol DidTapActionDelegate: AnyObject{
    func addToCartDidTap(_ cell: FG_RedemptionCatalogueTVC)
    func detailsDidTap(_ cell: FG_RedemptionCatalogueTVC)
}

class FG_RedemptionCatalogueTVC: UITableViewCell {

    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var addedToCartView: UIView!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var pointView: UIView!
    
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var addToCartLbl: UILabel!
    
    @IBOutlet weak var addedtocartLbl: UILabel!
    
    @IBOutlet weak var pointsHeadingLbl: UILabel!
    @IBOutlet weak var detailsOutBtn: UIButton!
    
    
    var imageUrl = ""
    var delegate: DidTapActionDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.pointView.clipsToBounds = true
        self.pointView.layer.cornerRadius = 16
        self.pointView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.productImage.clipsToBounds = true
        self.productImage.layer.cornerRadius = 16
        self.productImage.layer.maskedCorners = [.layerMinXMinYCorner]
        
        self.addToCartLbl.text = "addToCart".localiz()
        self.addedtocartLbl.text = "addedToCart".localiz()
        self.pointsHeadingLbl.text = "Points".localiz()
        self.detailsOutBtn.setTitle("Details".localiz(), for: .normal)
        
    }

    @IBAction func didTappedImageViewBtn(_ sender: UIButton) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    @IBAction func addToCartButton(_ sender: Any) {
        self.delegate.addToCartDidTap(self)
    }
    @IBAction func addedToCartButton(_ sender: Any) {
    }
    @IBAction func addToDreamGiftButton(_ sender: Any) {
    }
    @IBAction func addedToDreamGiftButton(_ sender: Any) {
    }
    @IBAction func detailsBtn(_ sender: Any) {
        self.delegate.detailsDidTap(self)
    }
    
}
