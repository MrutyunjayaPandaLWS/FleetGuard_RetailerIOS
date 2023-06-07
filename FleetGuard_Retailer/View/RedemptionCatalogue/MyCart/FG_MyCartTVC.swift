//
//  FG_MyCartTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
protocol CatalogueActionDelegate: AnyObject{
    
    func removeBtnDidTap(_ cell: FG_MyCartTVC)
    func plusBtnDidTap(_ cell: FG_MyCartTVC)
    func minusBtnDidTap(_ cell: FG_MyCartTVC)
}

class FG_MyCartTVC: UITableViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var pointsTitle: UILabel!
    @IBOutlet weak var qtyTF: UITextField!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var pointView: UIView!
    
    var delegate: CatalogueActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.pointView.clipsToBounds = true
        self.pointView.layer.cornerRadius = 16
        self.pointView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.productImage.clipsToBounds = true
        self.productImage.layer.cornerRadius = 16
        self.productImage.layer.maskedCorners = [.layerMinXMinYCorner]
        self.qtyTF.isEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func qtyEditingDidEnd(_ sender: Any) {
    }
    @IBAction func minusBtn(_ sender: Any) {
        self.delegate?.minusBtnDidTap(self)
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        self.delegate?.plusBtnDidTap(self)
    }
    
    @IBAction func removeButton(_ sender: Any) {
        self.delegate?.removeBtnDidTap(self)
    }
}
