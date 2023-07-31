//
//  FG_MyBillingTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 25/01/2023.
//

import UIKit

protocol myBillingsDelegate {
    func billingDelegate(_ cell: FG_MyBillingTVC)
}

class FG_MyBillingTVC: UITableViewCell {

    
    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var totalValueLbl: UILabel!
    @IBOutlet weak var invoiceDateLbl: UILabel!
    @IBOutlet weak var invoiceNoLbl: UILabel!

    var delegate: myBillingsDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func viewBtn(_ sender: Any) {
        self.delegate.billingDelegate(self)
    }
}
