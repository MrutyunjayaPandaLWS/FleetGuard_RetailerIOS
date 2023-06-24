//
//  RPLStatementVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

class RPLStatementVC: BaseViewController {

    @IBOutlet weak var noteTextLbl: UILabel!
    @IBOutlet weak var bonusTrendsTitleLbl: UILabel!
    @IBOutlet weak var rangeTrandsTitleLbl: UILabel!
    @IBOutlet weak var pointstrendTitleLbl: UILabel!
    @IBOutlet weak var milestonePointsTitleLbl: UILabel!
    @IBOutlet weak var balanccepointTitleLbl: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var shopNameLbl: UILabel!
    @IBOutlet weak var rlpStatementLbl: UILabel!
    @IBOutlet weak var rplNoTitleLbl: UILabel!
    
    @IBOutlet weak var statementViewTitleLbl: UILabel!
    @IBOutlet weak var milestoneRedeemBtn: GradientButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var shopNameValue: UILabel!
    @IBOutlet weak var rlpNoValueLbl: UILabel!
    
    @IBOutlet weak var pointBalanceRedeemBtn: GradientButton!
    @IBOutlet weak var milestonePts: UILabel!
    @IBOutlet weak var balancePts: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    
    let passBookNumber = UserDefaults.standard.string(forKey: "passBookNumber") ?? ""
    
    var VM = RLPStatementVM()
    var pointBalance = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            localization()
            self.VM.VC = self
            self.rlpNoValueLbl.text = passBookNumber
            self.rlpStatemnet()
            getLastDayOfPreviousMonth()
            pointsAPI()
            lastPreviousData()
        }
        
        
        
    }
    
    private func localization(){
        headerLbl.text = "RPL_Statement".localiz()
        shopNameLbl.text = "Shop_name".localiz()
        rplNoTitleLbl.text = "RPL_No".localiz()
        balanccepointTitleLbl.text = "Balance_Points".localiz()
        milestonePointsTitleLbl.text = "Milestone_Points".localiz()
        pointBalanceRedeemBtn.setTitle("Redeem_Now".localiz(), for: .normal)
        milestoneRedeemBtn.setTitle("Redeem_Now".localiz(), for: .normal)
        statementViewTitleLbl.text = "statementView".localiz()
        pointstrendTitleLbl.text = "points_trends".localiz()
        rangeTrandsTitleLbl.text = "range_trends".localiz()
        bonusTrendsTitleLbl.text = "bonus_trend".localiz()
    }
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        topView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        topView.layer.cornerRadius = 40
    }
    
    
    
    func getLastDayOfPreviousMonth() -> Date? {
        let currentDate = Date()
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        dateComponents.day = 0
        return calendar.date(from: dateComponents)
    }

    func lastPreviousData() {
        let lastDayOfPreviousMonth = getLastDayOfPreviousMonth()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let lastDayOfPreviousMonth = lastDayOfPreviousMonth {
            let formattedDate = dateFormatter.string(from: lastDayOfPreviousMonth)
            print("Last day of the previous month: \(formattedDate)")
            let dateNote = "\("NoteDateason".localiz()) \(formattedDate)"
            self.noteTextLbl.text = dateNote
        } else {
            print("Failed to calculate the last day of the previous month.")
        }
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
        vc.itsFrom = "SideMenu"
        vc.pointsBal = self.pointBalance
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func statementNewBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_StatementVC") as! FG_StatementVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ptsTrendbtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PointsTrendGraphVC") as! FG_PointsTrendGraphVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func rangeTrendBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_RangeTrendGraphVC") as! FG_RangeTrendGraphVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func bonusTrendBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_BonusTrendGraphVC") as! FG_BonusTrendGraphVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func rlpStatemnet(){
        let parameters = [
            "ActionType": "3",
            "ActorId":"\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.rlpStatemnetData(parameters: parameters)
    }
    
    func pointsAPI(){
        UserDefaults.standard.set(false, forKey: "AfterLog")
        UserDefaults.standard.synchronize()
        let parameters = [
              "ActionType": "1",
              "LoyaltyId": "\(loyaltyId)"
        ] as [String: Any]
        print(parameters)
        self.VM.pointBalenceAPI(parameter: parameters)
        
    }
    
}
