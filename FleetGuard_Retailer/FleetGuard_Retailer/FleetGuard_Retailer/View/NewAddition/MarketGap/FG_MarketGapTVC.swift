//
//  FG_MarketGapTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

protocol MarketingGapDelegate {
    func marketGapForward(_ cell:FG_MarketGapTVC)
}

class FG_MarketGapTVC: UITableViewCell {
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var mrpAmountLbl: UILabel!
    @IBOutlet weak var mrpTitleLbl: UILabel!
    @IBOutlet weak var dapAmount: UILabel!
    @IBOutlet weak var dapTitleLbl: UILabel!
    @IBOutlet weak var partNoLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var imageUrl = ""
    var delegate: MarketingGapDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func forwardBtn(_ sender: Any) {
        self.delegate.marketGapForward(self)
    }
    
}
