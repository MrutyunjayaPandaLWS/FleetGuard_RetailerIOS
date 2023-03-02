//
//  querylistingTableViewCell.swift
//  CenturyPly_JSON
//
//  Created by ADMIN on 25/04/2022.
//

import UIKit

class querylistingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var querytime: UILabel!
    @IBOutlet weak var querydate: UILabel!
    @IBOutlet weak var querydetails: UILabel!
    @IBOutlet weak var querycode: UILabel!
    @IBOutlet weak var querystatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ///
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
