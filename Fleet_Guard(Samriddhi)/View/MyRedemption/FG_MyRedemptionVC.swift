//
//  FG_MyRedemptionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_MyRedemptionVC: BaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var myRedemptionTableView: UITableView!
    @IBOutlet weak var fromDateBtn: UIButton!
    @IBOutlet weak var toDateBtn: UIButton!
    
    @IBOutlet weak var noteLbl: UILabel!
    
    @IBOutlet weak var filterByStatusLbl: UILabel!
    
    @IBOutlet weak var pendingBtn: UIButton!
    
    @IBOutlet weak var approvedBtn: UIButton!
    
    @IBOutlet weak var cancelledBtn: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    
    
    var itsFrom = ""
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var VM = MyRedemptionListingVM()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        myRedemptionTableView.delegate = self
        myRedemptionTableView.dataSource = self
        self.filterView.isHidden = true
        
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 20
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        filterView.clipsToBounds = true
        filterView.layer.cornerRadius = 20
        filterView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        if self.itsFrom == "SideMenu"{
            self.backBtn.isHidden = false
        }else{
            self.backBtn.isHidden = true
        }
        self.myRedemptionListing()
    }
    
    
    func myRedemptionListing(){
        let parameter = [
            "ActionType": "52",
            "ActorId": "\(self.userId)",
            "ObjCatalogueDetails": [
                "JFromDate": "",
                "JToDate": "",
                "SelectedStatus": "-1"
            ]
            ]as [String: Any]
        self.VM.myRedemptionLists(parameters: parameter)
        }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func languageBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func filterBtn(_ sender: Any) {
        if self.filterView.isHidden == false{
            self.filterView.isHidden = true
        }else{
            self.filterView.isHidden = false
        }
    }
    @IBAction func closeBtn(_ sender: Any) {
        self.filterView.isHidden = true
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

extension FG_MyRedemptionVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myRedemptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyRedemptionTVC", for: indexPath) as! FG_MyRedemptionTVC
        cell.selectionStyle = .none
        cell.categoryTitleLbl.text = VM.myRedemptionList[indexPath.row].productName ?? ""
        //cell.refNoTitleLbl.text = "Ref.No"
        cell.refNoLbl.text = VM.myRedemptionList[indexPath.row].redemptionRefno
        cell.qtyLbl.text = "\(VM.myRedemptionList[indexPath.row].quantity ?? 0)"
        let date = (VM.myRedemptionList[indexPath.row].jRedemptionDate ?? "").split(separator: " ")
        cell.dateTitleLbl.text = "\(date[0])"
        cell.ptsLbl.text = "\(VM.myRedemptionList[indexPath.row].redeemedPoints ?? 0)"
        
        var statusDtata = VM.myRedemptionList[indexPath.row].status ?? 0
        //cell.statusLbl.setTitle("\(VM.myRedemptionList[indexPath.row].status ?? 0)", for: .normal)
        if statusDtata == 0{
            cell.statusLbl.setTitle("Pending",for: .normal)
            cell.statusLbl.backgroundColor = .systemOrange
        }else if statusDtata == 1{
            cell.statusLbl.setTitle("Approved", for: .normal)
            cell.statusLbl.backgroundColor = .systemGreen
        }else{
            cell.statusLbl.setTitle("Rejected", for: .normal)
            cell.statusLbl.backgroundColor = .systemRed
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
