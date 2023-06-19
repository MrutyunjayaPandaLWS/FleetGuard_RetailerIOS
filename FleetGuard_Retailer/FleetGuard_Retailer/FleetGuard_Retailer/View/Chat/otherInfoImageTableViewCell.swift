//
//  otherInfoImageTableViewCell.swift
//  demoCHAT
//
//  Created by Arokia-M3 on 06/01/21.
//

import UIKit

class otherInfoImageTableViewCell: UITableViewCell {
    @IBOutlet var customImage: UIView!
    @IBOutlet var itemcustomer: UILabel!
    @IBOutlet var itemTime: UILabel!
    @IBOutlet var itemimage: UIImageView!
    @IBOutlet var itemtext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        customImage.roundCorners(corners: [.bottomLeft, .topRight, .bottomRight], radius: 15.0)
 
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
