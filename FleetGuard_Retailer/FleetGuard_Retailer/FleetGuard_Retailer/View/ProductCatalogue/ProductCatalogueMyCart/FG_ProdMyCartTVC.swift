//
//  FG_ProdMyCartTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 25/01/2023.
//

import UIKit
protocol MyCartButtonActionDelegate: AnyObject{
    
    func didTapMinusBtn(_ cell: FG_ProdMyCartTVC)
    func didTapPlusBtn(_ cell: FG_ProdMyCartTVC)
    func didTapRemoveBtn(_ cell: FG_ProdMyCartTVC)
}

class FG_ProdMyCartTVC: UITableViewCell {

    @IBOutlet weak var dapTitleLbl: UILabel!
    @IBOutlet weak var partNoTitleLbl: UILabel!
    @IBOutlet weak var mrpTitleLbl: UILabel!
    @IBOutlet weak var valueTitleLbl: UILabel!
    @IBOutlet weak var ptsLbl: UILabel!
    @IBOutlet weak var qtyTF: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var pointView: UIView!
    
    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var partNoLbl: UILabel!
    
    @IBOutlet weak var dapLbl: UILabel!
    
    @IBOutlet weak var mrpLbl: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var removeBTn: UIButton!
    weak var delegate: MyCartButtonActionDelegate!
    
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

    @IBAction func deleteBtn(_ sender: Any) {
        self.delegate.didTapRemoveBtn(self)
    }
    
    
    @IBAction func minusBtn(_ sender: Any) {
        self.delegate.didTapMinusBtn(self)
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        self.delegate.didTapPlusBtn(self)
    }
    @IBAction func quanityEditingDidEnd(_ sender: Any) {
    }
}
