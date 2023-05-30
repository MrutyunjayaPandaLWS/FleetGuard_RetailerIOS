//
//  FG_MyEarningVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_MyEarningVC: BaseViewController {

    @IBOutlet weak var emptyMessageLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var myEarningTableView: UITableView!
    
    var itsFrom = ""
    
    var VM = MyEarningsVM()
    
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.myEarningTableView.delegate = self
        self.myEarningTableView.dataSource = self
        
        if self.itsFrom == "SideMenu"{
            self.backBtn.isHidden = false
        }else{
            self.backBtn.isHidden = true
        }
        
        self.myEarningsAPI()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func languageChangeBtn(_ sender: Any) {
    }
    @IBAction func notificaitonBell(_ sender: Any) {
    }
    
    func myEarningsAPI(){
        UserDefaults.standard.set(false, forKey: "AfterLog")
        UserDefaults.standard.synchronize()
        let parameter = [
            "ActionType": "2",
            "LoyaltyId": "\(self.loyaltyId)"
        ] as [String: Any]
        print(parameter)
        self.VM.myEarningsAPI(paramters: parameter)
        
    }
    
}
extension FG_MyEarningVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myEarningsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyEarningTVC", for: indexPath) as! FG_MyEarningTVC
        cell.selectionStyle = .none
        cell.bonusPtsLbl.text = "Bonus Points \(Int(VM.myEarningsArray[indexPath.row].referralBonusPoints ?? 0))"
        cell.totalPtsLbl.text = "Total Points \(VM.myEarningsArray[indexPath.row].totalEarnedPoints ?? 0)"
        cell.monthLblPts.text = "Months \(VM.myEarningsArray[indexPath.row].createdDate ?? "")"
        cell.fixedBasePtsLbl.text = "Fixed Base Points \(VM.myEarningsArray[indexPath.row].currentPointBalance ?? 0)"
        cell.miscellaneousPtsLbl.text = "Miscellaneous Points \(Int(VM.myEarningsArray[indexPath.row].multiplierPointBalance ?? 0))"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 160
//    }
    
}
