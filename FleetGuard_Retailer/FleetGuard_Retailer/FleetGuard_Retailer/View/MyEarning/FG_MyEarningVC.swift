//
//  FG_MyEarningVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit
import LanguageManager_iOS

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
        emptyMessageLbl.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localization()
        emptyMessageLbl.text = "noDataFound".localiz()
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            if self.itsFrom == "SideMenu"{
                self.backBtn.isHidden = false
            }else{
                self.backBtn.isHidden = true
            }
            
            self.myEarningsAPI()
        }
    }
    
    private func localization(){
        titleLbl.text = "My_Earnings".localiz()
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
        if VM.myEarningsArray.count == 0{
            emptyMessageLbl.isHidden = false
        }else{
            emptyMessageLbl.isHidden = true
        }
        return VM.myEarningsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyEarningTVC", for: indexPath) as! FG_MyEarningTVC
        cell.selectionStyle = .none
        cell.bonusPtsLbl.text = "\("BonusPoints".localiz()) \(Int(VM.myEarningsArray[indexPath.row].referralBonusPoints ?? 0))"
        cell.totalPtsLbl.text = "\("TotalPoints".localiz()) \(VM.myEarningsArray[indexPath.row].totalWithDrawl ?? 0)"
        cell.monthLblPts.text = "\("Months".localiz()) \(VM.myEarningsArray[indexPath.row].createdDate ?? "")"
        cell.fixedBasePtsLbl.text = "\("FixedBasePoints".localiz()) \(VM.myEarningsArray[indexPath.row].pointExpiryCount ?? 0)"
        cell.miscellaneousPtsLbl.text = "\("MiscellaneousPoints".localiz()) \(Int(VM.myEarningsArray[indexPath.row].multiplierPointBalance ?? 0))"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 160
//    }
    
}
