//
//  FG_RedemptionCataloguePopUp.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 24/02/23.
//

import UIKit
import LanguageManager_iOS

class FG_RedemptionCataloguePopUp: BaseViewController {
    
    @IBOutlet weak var infoLbl: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    @IBOutlet weak var goToDashBoatrdBtn: GradientButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        
    }
    
    func localize(){
        self.infoLbl.text = "Your order placed successfully !".localiz()
        self.goToDashBoatrdBtn.setTitle("Go to Dashboard".localiz(), for: .normal)
    }
    
    @IBAction func dashBoardBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .sendDashboard, object: nil)
        self.dismiss(animated: true)
    }
    
}
