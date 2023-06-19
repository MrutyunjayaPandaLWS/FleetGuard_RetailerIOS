//
//  HistoryNotificationsTableViewCell.swift
//  CenturyPly_JSON
//
//  Created by admin on 16/03/22.
//

import UIKit

protocol notificationDelgate{
    func didTappedNotificationimage(cell: HistoryNotificationsTableViewCell)
}

class HistoryNotificationsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIView!
    @IBOutlet weak var notificationImg: UIImageView!
    @IBOutlet weak var notificationHeader: UILabel!
    @IBOutlet weak var notificationPoints: UILabel!
    @IBOutlet weak var notificationMessage: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    var delegate: notificationDelgate?
    var imageUrl: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTappedViewImage(_ sender: UIButton) {
        delegate?.didTappedNotificationimage(cell: self)
    }
    
}
