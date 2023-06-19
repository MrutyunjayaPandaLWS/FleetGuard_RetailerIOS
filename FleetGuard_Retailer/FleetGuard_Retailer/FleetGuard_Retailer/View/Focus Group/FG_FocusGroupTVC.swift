//
//  FG_FocusGroupTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by admin on 05/06/23.
//

import UIKit
protocol FocusGroupTVCDelegate: class{
    func sendDataToDetails(_ cell: FG_FocusGroupTVC)
    func didTappedImageViewBtn(cell: FG_FocusGroupTVC)
}

class FG_FocusGroupTVC: UITableViewCell {
    @IBOutlet weak var imageViewBtn: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var partNoLbl: UILabel!
    @IBOutlet weak var dapLbl: UILabel!
    @IBOutlet weak var mrpLbl: UILabel!
    
    var delegate: FocusGroupTVCDelegate!
    var imageUrl: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    @IBAction func nextBtn(_ sender: Any) {
        self.delegate.sendDataToDetails(self)
    }
    
    @IBAction func didTappedImageDetailsBtn(_ sender: UIButton) {
        delegate.didTappedImageViewBtn(cell: self)
    }
    
}
