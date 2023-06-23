//
//  FG_MyRedemptionTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_MyRedemptionTVC: UITableViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var dateTitleLbl: UILabel!
    @IBOutlet weak var refNoTitleLbl: UILabel!
    @IBOutlet weak var refNoLbl: UILabel!
    @IBOutlet weak var qtyTitleLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var statusLbl: UIButton!
    @IBOutlet weak var ptsRedemeedLbl: UILabel!
    @IBOutlet weak var ptsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        localization()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func localization(){
        refNoTitleLbl.text = "Ref. No".localiz()
        ptsRedemeedLbl.text = "Points Redeemed".localiz()
        dateTitle.text = "Date".localiz()
        qtyTitleLbl.text = "Qty".localiz()
    }
    
}
