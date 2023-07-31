//
//  FG_ProductCataloguePopUp.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_ProductCataloguePopUp: BaseViewController {

    @IBOutlet weak var dashBoardBtn: UIButton!
    @IBOutlet weak var orderMoreBtn: GradientButton!
    @IBOutlet weak var infoLbl: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashBoardBtn.setTitle("Dashboard".localiz(), for: .normal)
        orderMoreBtn.setTitle("Order More".localiz(), for: .normal)
    }

    @IBAction func dashBoardBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .navigateToDashboard, object: nil)
        self.dismiss(animated: true)
    }
    @IBAction func orderMoreBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .navigateToProductList, object: nil)
        self.dismiss(animated: true)
        
    }
    
}
