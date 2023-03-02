//
//  customerqueryTableViewCell.swift
//  CenturyPly_JSON
//
//  Created by ADMIN on 25/04/2022.
//

import UIKit

class customerqueryTableViewCell: UITableViewCell {

    @IBOutlet weak var topicslabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.topicslabel.textColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
