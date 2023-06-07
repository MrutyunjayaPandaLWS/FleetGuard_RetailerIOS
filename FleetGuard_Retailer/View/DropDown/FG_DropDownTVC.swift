//
//  FG_DropDownTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 04/02/2023.
//

import UIKit

class FG_DropDownTVC: UITableViewCell {

    @IBOutlet weak var dropdownInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
