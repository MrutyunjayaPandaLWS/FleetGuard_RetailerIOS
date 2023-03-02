//
//  FG_RedemptionCataloguePopUp.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 24/02/23.
//

import UIKit


class FG_RedemptionCataloguePopUp: BaseViewController {
    
    @IBOutlet weak var infoLbl: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dashBoardBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .navigateToDashboard, object: nil)
        self.dismiss(animated: true)
    }
    
}
