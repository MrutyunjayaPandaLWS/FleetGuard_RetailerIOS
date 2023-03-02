//
//  FG_CounterGapTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_CounterGapTVC: UITableViewCell {

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var mrpAmountLbl: UILabel!
    @IBOutlet weak var mrpTitleLbl: UILabel!
    @IBOutlet weak var dapAmount: UILabel!
    @IBOutlet weak var dapTitleLbl: UILabel!
    @IBOutlet weak var partNoLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func forwardBtn(_ sender: Any) {
    }
}
