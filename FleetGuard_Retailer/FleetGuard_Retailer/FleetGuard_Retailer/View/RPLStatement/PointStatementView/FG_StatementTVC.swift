//
//  FG_StatementTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 25/01/2023.
//

import UIKit

protocol StatementViewDelegate: AnyObject{
    func viewActBTN(_ cell: FG_StatementTVC)
}

class FG_StatementTVC: UITableViewCell {

    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var pointEarnedLbl: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var viewOutBtn: UIButton!
    
    weak var delegate: StatementViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    @IBAction func viewBtn(_ sender: Any) {
        self.delegate.viewActBTN(self)
    }
}
