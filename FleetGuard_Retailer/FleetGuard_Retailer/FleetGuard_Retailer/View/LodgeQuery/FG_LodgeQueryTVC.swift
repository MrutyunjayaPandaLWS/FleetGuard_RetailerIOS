//
//  FG_LodgeQueryTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 31/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_LodgeQueryTVC: UITableViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var queryInfoLbl: UILabel!
    @IBOutlet weak var queryTypeLhl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var queryId: UILabel!
    @IBOutlet weak var subView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 16
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.queryTypeLhl.text = "Query Type".localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
