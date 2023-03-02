//
//  SelectquerytopicInListingTableViewCell.swift
//  CenturyPly_JSON
//
//  Created by ADMIN on 25/04/2022.
//


import UIKit

class SelectquerytopicInListingTableViewCell: UITableViewCell {

    @IBOutlet weak var topicholdingview: UIView!
    @IBOutlet weak var topicnamelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
