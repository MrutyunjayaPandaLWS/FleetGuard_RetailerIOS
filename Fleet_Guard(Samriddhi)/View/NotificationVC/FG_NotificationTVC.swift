//
//  FG_NotificationTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 13/03/23.
//

import UIKit

class FG_NotificationTVC: UITableViewCell {

 
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet var pushMessageLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
