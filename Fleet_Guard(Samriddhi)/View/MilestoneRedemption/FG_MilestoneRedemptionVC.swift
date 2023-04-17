//
//  FG_MyRedemptionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_MilestoneRedemptionVC : BaseViewController, mileStoneDelegateData{
    func doenloadData(_ cell: MilestoneRedemptionListingTVC) {
        guard let tappedIndexPath = self.myRedemptionTableView.indexPath(for: cell) else{return}
        self.saveMileStoneCode = VM.myRedemptionList[tappedIndexPath.row].milstoneCode ?? ""
        self.redeemDataAPI()
    }
    

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
    
    
    var itsFrom = ""
    var comingFrom = ""
    var saveMileStoneCode = ""
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var VM = MileStoneRedemptionListVM()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        myRedemptionTableView.delegate = self
        myRedemptionTableView.dataSource = self
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
        cell.leavelPointsLbl.text =  "\(VM.myRedemptionList[indexPath.row].mileStonePoint ?? 0)"
        
        cell.descriptionDataLbl.text = VM.myRedemptionList[indexPath.row].description ?? ""
        
        let fromDate = VM.myRedemptionList[indexPath.row].fromDate ?? ""
        let toDate = VM.myRedemptionList[indexPath.row].toDate ?? ""
        let splitFrom = fromDate.split(separator: " ")
        let splitToDate = toDate.split(separator: " ")
        
        let compbinedDta = "From -\(splitFrom[0]) " + "To -\(splitToDate[0])"
        cell.validityDataLbl.text = compbinedDta
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
