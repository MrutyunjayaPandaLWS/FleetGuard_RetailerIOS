//
//  FG_MyMilestoneRedemptionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_MyMilestoneRedemptionVC: BaseViewController, DateSelectedDelegate {
   
    func acceptDate(_ vc: FG_DOBVC) {
        if vc.isComeFrom == "1"{
            self.selectedFromDate = vc.selectedDate
            self.fromDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
        }else{
            self.selectedToDate = vc.selectedDate
            self.toDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
        }
    }
    func declineDate(_ vc: FG_DOBVC) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var filterShadowView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var myMilestoneRedemptionTableView: UITableView!
    @IBOutlet weak var fromDateBtn: UIButton!
    @IBOutlet weak var toDateBtn: UIButton!
    @IBOutlet weak var noteLbl: UILabel!
    @IBOutlet weak var filterByStatusLbl: UILabel!
    @IBOutlet weak var pendingBtn: UIButton!
    @IBOutlet weak var approvedBtn: UIButton!
    @IBOutlet weak var cancelledBtn: UIButton!
    @IBOutlet weak var clearAllBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var noDataFoundLBl: UILabel!
    @IBOutlet weak var filterOutBTN: UIButton!
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var itsFrom = ""
    var VM = MileStoneRedemptionVM()
    var selectedFromDate = ""
    var selectedToDate = ""
    var status = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        myMilestoneRedemptionTableView.delegate = self
        myMilestoneRedemptionTableView.dataSource = self
        myMilestoneRedemptionTableView.separatorStyle = .none
        self.noDataFoundLBl.text = "noDataFound".localiz()
        self.filterShadowView.isHidden = true
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 20
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        filterView.clipsToBounds = true
        filterView.layer.cornerRadius = 20
        filterView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.backBtn.isHidden = false
        self.fromDateBtn.setTitle("Fromdate".localiz(), for: .normal)
        self.toDateBtn.setTitle("Todate".localiz(), for: .normal)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            noDataFoundLBl.isHidden = true
            localization()
            self.mileStoneRedemptionAPI()
        }
    }

    
    private func localization(){
        headerText.text = "My_Milestone_Redemption".localiz()
        self.filterTitle.text = "Filter".localiz()
        self.filterByStatusLbl.text = "Filter_by_Status".localiz()
        self.clearAllBtn.setTitle("Clear_all".localiz(), for: .normal)
        self.applyBtn.setTitle("Apply".localiz(), for: .normal)
        
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.status = ""
//        self.fromDateBtn.setTitle("From Date", for: .normal)
//        self.toDateBtn.setTitle("To Date", for: .normal)
//        self.approvedBtn.backgroundColor = .white
//        self.pendingBtn.backgroundColor = .white
//        self.cancelledBtn.backgroundColor = .white
//        selectedFromDate = ""
//        selectedToDate = ""
//        self.filterShadowView.isHidden = true
//    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func filterBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            if self.filterShadowView.isHidden == false{
                self.filterShadowView.isHidden = true
            }else{
                self.filterShadowView.isHidden = false
            }
        }
    }
    @IBAction func closeBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.filterShadowView.isHidden = true
        }
    }
    
    @IBAction func fromDateButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
            vc!.delegate = self
            vc!.isComeFrom = "1"
            vc!.modalPresentationStyle = .overCurrentContext
            vc!.modalTransitionStyle = .coverVertical
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func toDateButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
            vc!.delegate = self
            vc!.isComeFrom = "2"
            vc!.modalPresentationStyle = .overCurrentContext
            vc!.modalTransitionStyle = .coverVertical
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func pendingButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.status = "0"
            self.approvedBtn.backgroundColor = .white
            self.pendingBtn.backgroundColor = .systemOrange
            self.cancelledBtn.backgroundColor = .white
        }
    }
    
    @IBAction func approvedButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.status = "1"
            self.approvedBtn.backgroundColor = .systemOrange
            self.pendingBtn.backgroundColor = .white
            self.cancelledBtn.backgroundColor = .white
        }
        
    }
    
    @IBAction func cancelledButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.status = "2"
            self.approvedBtn.backgroundColor = .white
            self.pendingBtn.backgroundColor = .white
            self.cancelledBtn.backgroundColor = .systemOrange
        }
    }
    @IBAction func applyButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            
            if self.fromDateBtn.currentTitle == "Fromdate".localiz() && self.toDateBtn.currentTitle == "Todate".localiz() && self.status == ""{
                self.view.makeToast("Select date or filter status or both", duration: 2.0, position: .center)
            }else if self.fromDateBtn.currentTitle == "Fromdate".localiz() && self.toDateBtn.currentTitle == "Todate".localiz() && self.status != ""{
                
                mileStoneRedemptionAPI()
                self.filterShadowView.isHidden = true
                
            }else if self.fromDateBtn.currentTitle != "Fromdate".localiz() && self.toDateBtn.currentTitle == "Todate".localiz(){
                
                self.view.makeToast("Select To Date".localiz(), duration: 2.0, position: .center)
                
            }else if self.fromDateBtn.currentTitle == "Fromdate".localiz() && self.toDateBtn.currentTitle != "Todate".localiz(){
                
                self.view.makeToast("Select From Date".localiz(), duration: 2.0, position: .center)
                
            }else if self.fromDateBtn.currentTitle != "Fromdate".localiz() && self.toDateBtn.currentTitle != "Todate".localiz() && self.status == "" || self.status != ""{
                
                if selectedToDate < selectedFromDate{
                    
                    self.view.makeToast("ToDate should be lower than FromDate".localiz(), duration: 2.0, position: .center)
                    
                }else if self.fromDateBtn.currentTitle == "Fromdate".localiz() && self.toDateBtn.currentTitle == "Todate".localiz() && self.status != ""{
                    
                    mileStoneRedemptionAPI()
                    self.filterShadowView.isHidden = true
                }else{
                    mileStoneRedemptionAPI()
                    self.filterShadowView.isHidden = true
                }
                
            }else{
                
                mileStoneRedemptionAPI()
                self.filterShadowView.isHidden = true
            }
        }
        
        
    }
    @IBAction func clearAllBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.status = ""
            self.fromDateBtn.setTitle("Fromdate".localiz(), for: .normal)
            self.toDateBtn.setTitle("Todate".localiz(), for: .normal)
            self.approvedBtn.backgroundColor = .white
            self.pendingBtn.backgroundColor = .white
            self.cancelledBtn.backgroundColor = .white
            selectedFromDate = ""
            selectedToDate = ""
            mileStoneRedemptionAPI()
            self.filterShadowView.isHidden = true
        }
    }
    
    
    func mileStoneRedemptionAPI(){
        let parameters = [
            "ActionType": "1",
            "ActorId":"\(userId)",
            "FromDate": "\(self.selectedFromDate)",
            "ToDate": "\(self.selectedToDate)",
            "Status": "\(self.status)"
        ] as [String: Any]
        print(parameters)
        self.VM.mileStoneRedemptionAPI(parameters: parameters)
    }
}

extension FG_MyMilestoneRedemptionVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.mileStonRedemptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyMilestoneRedemptionTVC") as! FG_MyMilestoneRedemptionTVC
        
        cell.selectionStyle = .none
        cell.categoryNameLbl.text = VM.mileStonRedemptionArray[indexPath.row].milstoneCode ?? "-"
        cell.date.text = VM.mileStonRedemptionArray[indexPath.row].date ?? "-"
        cell.statusBtn.setTitle(VM.mileStonRedemptionArray[indexPath.row].status ?? "-", for: .normal)
        cell.categoryTitle.text = "Milestone Code"
        
        if cell.statusBtn.currentTitle == "Pending"{
            cell.statusBtn.backgroundColor = .systemOrange
        }else if cell.statusBtn.currentTitle == "Approved" {
            cell.statusBtn.backgroundColor = .systemGreen
        }else if cell.statusBtn.currentTitle == "Canceled"{
            cell.statusBtn.backgroundColor = .systemRed
        }else{
            cell.statusBtn.backgroundColor = .gray
        }
        
        return cell
    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
}
