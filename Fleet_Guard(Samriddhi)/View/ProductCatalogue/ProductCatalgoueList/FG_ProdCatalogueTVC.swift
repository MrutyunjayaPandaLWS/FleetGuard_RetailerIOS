//
//  FG_ProdCatalogueTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
protocol SendDataToDetailsDelegate: class{
    func sendDataToDetails(_ cell: FG_ProdCatalogueTVC)
}

class FG_ProdCatalogueTVC: UITableViewCell {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mrpValue: UILabel!
    @IBOutlet weak var dapValue: UILabel!
    @IBOutlet weak var partNoLbl: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var delegate: SendDataToDetailsDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func nextBtn(_ sender: Any) {
        self.delegate.sendDataToDetails(self)
    }
}
