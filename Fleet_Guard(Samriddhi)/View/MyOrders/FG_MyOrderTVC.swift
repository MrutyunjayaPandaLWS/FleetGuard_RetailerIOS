//
//  FG_MyOrderTVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 25/01/2023.
//

import UIKit
import LanguageManager_iOS

protocol myOrderDelegate {
    func myOrderDelegate(_ cell: FG_MyOrderTVC)
}

class FG_MyOrderTVC: UITableViewCell {

    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var orderDateLbl: UILabel!
    @IBOutlet weak var myOrderLbl: UILabel!
    @IBOutlet var orderIndexStackView: UIStackView!
    @IBOutlet weak var viewButtn: UIButton!
    
    var delegate: myOrderDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        localization()
    }
    
    private func localization(){
        viewButtn.setTitle("View".localiz(), for: .normal)
    }

    @IBAction func viewBtn(_ sender: Any) {
        self.delegate.myOrderDelegate(self)
    }
}
