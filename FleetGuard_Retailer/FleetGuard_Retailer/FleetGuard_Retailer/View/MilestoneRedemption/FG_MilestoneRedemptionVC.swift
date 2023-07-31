//
//  FG_MyRedemptionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_MilestoneRedemptionVC : BaseViewController, mileStoneDelegateData{
    func doenloadData(_ cell: MilestoneRedemptionListingTVC) {
        guard let tappedIndexPath = self.myRedemptionTableView.indexPath(for: cell) else{return}
        self.saveMileStoneCode = VM.myRedemptionList[tappedIndexPath.row].milstoneCode ?? ""
        self.levelPoints = cell.levelpoints
        self.redeemDataAPI()
    }
    

    @IBOutlet weak var nodatafoundLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
//    @IBOutlet weak var filterTitle: UILabel!
//    @IBOutlet weak var subView: UIView!
//    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var myRedemptionTableView: UITableView!
//    @IBOutlet weak var fromDateBtn: UIButton!
//    @IBOutlet weak var toDateBtn: UIButton!
    
    //@IBOutlet weak var noteLbl: UILabel!
    
//    @IBOutlet weak var filterByStatusLbl: UILabel!
//
//    @IBOutlet weak var pendingBtn: UIButton!
//
//    @IBOutlet weak var approvedBtn: UIButton!
//
//    @IBOutlet weak var cancelledBtn: UIButton!
//
//    @IBOutlet weak var clearButton: UIButton!
//    @IBOutlet weak var applyBtn: UIButton!
    
    var color1 = #colorLiteral(red: 0.4804053903, green: 0.7616635561, blue: 0.2726997733, alpha: 1)
    var color2 = #colorLiteral(red: 0.4804053903, green: 0.7616635561, blue: 0.2726997733, alpha: 0.5)
    var itsFrom = ""
    var comingFrom = ""
    var saveMileStoneCode = ""
    var levelPoints = 0
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var VM = MileStoneRedemptionListVM()
    var pointsBal = ""

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
            self.VM.VC = self
            myRedemptionTableView.delegate = self
            myRedemptionTableView.dataSource = self
            nodatafoundLbl.isHidden = true
            //self.filterView.isHidden = true
            
            //        subView.clipsToBounds = true
            //        subView.layer.cornerRadius = 20
            //        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            //        filterView.clipsToBounds = true
            //        filterView.layer.cornerRadius = 20
            //        filterView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            if self.itsFrom == "SideMenu"{
                self.backBtn.isHidden = false
            }else{
                self.backBtn.isHidden = true
            }
            self.myRedemptionListing()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localization()
    }
    private func localization(){
        nodatafoundLbl.text = "noDataFound".localiz()
        headerText.text = "My_Milestone_Redemption".localiz()
    }
    
    
    func myRedemptionListing(){
        let parameter = [
            "ActionType": 2,
            "ActorId": userId
            ]as [String: Any]
        self.VM.mileStonesRedemptionListAPI(parameters: parameter)
        }
    
    
    func redeemDataAPI(){
        let parameters = [
        "ActionType": 3,
        "ActorId": userId,
        "MileStoneCode":"\(saveMileStoneCode)"
        ]as [String: Any]
        print(parameters)
        self.VM.redeemBTNAPI(parameters: parameters)
        }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func filterBtn(_ sender: Any) {
//        if self.filterView.isHidden == false{
//            self.filterView.isHidden = true
//        }else{
//            self.filterView.isHidden = false
//        }
    }
    @IBAction func closeBtn(_ sender: Any) {
        //self.filterView.isHidden = true
    }
    
    @IBAction func fromDateButton(_ sender: Any) {
    }
    
    @IBAction func toDateButton(_ sender: Any) {
    }
    
    @IBAction func pendingButton(_ sender: Any) {
    }
    
    @IBAction func approvedButton(_ sender: Any) {
    }
    
    @IBAction func cancelledButton(_ sender: Any) {
    }
    
    @IBAction func applyButton(_ sender: Any) {
    }
    
    @IBAction func clearbtn(_ sender: Any) {
    }
   
}

extension FG_MilestoneRedemptionVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myRedemptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MilestoneRedemptionListingTVC", for: indexPath) as! MilestoneRedemptionListingTVC
        cell.selectionStyle = .none
        cell.delegate = self
        cell.milestoneCodeDataLbl.text = VM.myRedemptionList[indexPath.row].milstoneCode ?? ""
        let levelPoints = VM.myRedemptionList[indexPath.row].mileStonePoint ?? 0
        cell.leavelPointsLbl.text =  "\(levelPoints)"
        cell.descriptionDataLbl.text = VM.myRedemptionList[indexPath.row].description ?? ""
        cell.levelpoints = levelPoints
        let fromDate = VM.myRedemptionList[indexPath.row].fromDate ?? ""
        let toDate = VM.myRedemptionList[indexPath.row].toDate ?? ""
        let splitFrom = fromDate.split(separator: " ")
        let splitToDate = toDate.split(separator: " ")
        
        let compbinedDta = "From -\(splitFrom[0]) " + "To -\(splitToDate[0])"
        cell.validityDataLbl.text = compbinedDta
        if levelPoints < (Int(pointsBal) ?? 0){
            if levelPoints < 0{
                cell.downloadBTN.isEnabled = false
                cell.downloadBTN.backgroundColor = color2
            }else{
                cell.downloadBTN.isEnabled = true
                cell.downloadBTN.backgroundColor = color1
            }
            
        }else{
            cell.downloadBTN.isEnabled = false
            cell.downloadBTN.backgroundColor = color2
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
