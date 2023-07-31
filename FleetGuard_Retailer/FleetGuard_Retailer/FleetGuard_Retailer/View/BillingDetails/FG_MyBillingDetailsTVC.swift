//
//  FG_MyBillingDetailsTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 06/03/23.
//

import UIKit
import LanguageManager_iOS

class FG_MyBillingDetailsTVC: UITableViewCell {
    
    
    @IBOutlet weak var totalValuetitleLbl: UILabel!
    @IBOutlet weak var orderQuantityTitleLbl: UILabel!
    @IBOutlet weak var partNoTitlelbl: UILabel!
    @IBOutlet var productNameHeadingLbl: UILabel!
    @IBOutlet var paetNumberLbl: UILabel!
    @IBOutlet var qtyLbl: UILabel!
    @IBOutlet var valueLbl: UILabel!
    @IBOutlet var billingimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        localization()
    }
    
    private func localization(){
        totalValuetitleLbl.text = "Value".localiz()
        orderQuantityTitleLbl.text = "Order Qty".localiz()
        partNoTitlelbl.text = "Part No".localiz()
    }
    
}
