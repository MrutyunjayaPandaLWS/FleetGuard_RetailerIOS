//
//  RPLStatementVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class RPLStatementVC: BaseViewController {

    @IBOutlet weak var shopNameLbl: UILabel!
    @IBOutlet weak var rlpStatementLbl: UILabel!
    
    @IBOutlet weak var shopNameValue: UILabel!
    @IBOutlet weak var rlpNoValueLbl: UILabel!
    
    @IBOutlet weak var milestonePts: UILabel!
    @IBOutlet weak var balancePts: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    
    let passBookNumber = UserDefaults.standard.string(forKey: "passBookNumber") ?? ""
    
    var VM = RLPStatementVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.rlpNoValueLbl.text = passBookNumber
        self.rlpStatemnet()
    }
    
    

    @IBAction func languageChangeBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func bellBtn(_ sender: Any) {
    }
    @IBAction func balancePtsRedeemBtn(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RedemptionCatalogueVC") as! FG_RedemptionCatalogueVC
        vc.comingFrom = "Statement"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func milestonePtsRedeemBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MilestoneRedemptionVC") as! FG_MilestoneRedemptionVC
        vc.comingFrom = "Statement"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func statementNewBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_StatementVC") as! FG_StatementVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ptsTrendbtn(_ sender: Any) {
        
        
    }
    
    @IBAction func rangeTrendBtn(_ sender: Any) {
    }
    @IBAction func bonusTrendBtn(_ sender: Any) {
    }
    
    func rlpStatemnet(){
        let parameters = [
            "ActionType": "3",
            "ActorId":"\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.rlpStatemnetData(parameters: parameters)
    }
    
}
