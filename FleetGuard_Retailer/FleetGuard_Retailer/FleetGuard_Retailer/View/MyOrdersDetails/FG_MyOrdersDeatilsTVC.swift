//
//  FG_MyOrdersDeatilsTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 21/02/23.
//

import UIKit
import LanguageManager_iOS

class FG_MyOrdersDeatilsTVC: UITableViewCell {

    @IBOutlet weak var statusTitleLbl: UILabel!
    @IBOutlet weak var dispatchQtyTitleLbl: UILabel!
    @IBOutlet weak var orderQTYTitleLbl: UILabel!
    @IBOutlet weak var partNoTitleLbl: UILabel!
    @IBOutlet var orderDetailsImg: UIImageView!
    @IBOutlet var productHeadingLbl: UILabel!
    @IBOutlet var partNoLbl: UILabel!
    @IBOutlet var orderQTYLbl: UILabel!
    @IBOutlet var dispatchQtyLbl: UILabel!
    @IBOutlet var statusLbl: UILabel!
    @IBOutlet var productView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        localization()
    }

    private func localization(){
        dispatchQtyTitleLbl.text = "Dispatched Qty".localiz()
        orderQTYTitleLbl.text = "Order Qty".localiz()
        partNoTitleLbl.text = "Part No".localiz()
        statusTitleLbl.text = "Status".localiz()
    }
}
