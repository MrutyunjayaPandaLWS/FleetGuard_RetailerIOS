//
//  FG_CounterGapTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

protocol CounterGapDelegate {
    func counterGapForward(_ cell:FG_CounterGapTVC)
}

class FG_CounterGapTVC: UITableViewCell {

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var mrpAmountLbl: UILabel!
    @IBOutlet weak var mrpTitleLbl: UILabel!
    @IBOutlet weak var dapAmount: UILabel!
    @IBOutlet weak var dapTitleLbl: UILabel!
    @IBOutlet weak var partNoLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var delegate: CounterGapDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }


    @IBAction func forwardBtn(_ sender: Any) {
        self.delegate.counterGapForward(self)
    }
}
