//
//  senderInfoTableViewCell.swift
//  demoCHAT
//
//  Created by Arokia-M3 on 06/01/21.
//

import UIKit

class senderInfoTableViewCell: UITableViewCell {

    @IBOutlet var customView: UIView!
    @IBOutlet var itemcustomer: UILabel!
    @IBOutlet var itemTime: UILabel!
    @IBOutlet var itemText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        customView.roundCorners(corners: [.bottomLeft, .topLeft, .bottomRight], radius: 15.0)

    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
