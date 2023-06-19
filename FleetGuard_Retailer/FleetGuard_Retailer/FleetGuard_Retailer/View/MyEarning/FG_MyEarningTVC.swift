//
//  FG_MyEarningTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_MyEarningTVC: UITableViewCell {

    @IBOutlet weak var fixedBasePtsLbl: UILabel!
    
    @IBOutlet weak var bonusPtsLbl: UILabel!
    
    @IBOutlet weak var miscellaneousPtsLbl: UILabel!
    
    @IBOutlet weak var totalPtsLbl: UILabel!
    
    @IBOutlet weak var monthLblPts: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
