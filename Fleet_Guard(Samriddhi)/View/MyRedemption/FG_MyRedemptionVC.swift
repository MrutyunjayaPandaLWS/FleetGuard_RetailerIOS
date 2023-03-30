//
//  FG_MyRedemptionVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 18/01/2023.
//

import UIKit

class FG_MyRedemptionVC: BaseViewController, DateSelectedDelegate {
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
    
    @IBOutlet weak var filterOPBTN: UIButton!
    @IBOutlet weak var noDataFoundLbl: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    var itsFrom = ""
    var status = "-1"
    var selectedFromDate = ""
    var selectedToDate = ""
    var collectionViewCatagory = ""
    var collectionViewDataNumber = ""
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var VM = MyRedemptionListingVM()
    var collectionData:[String] = ["Pending","Processed","Rejected","Vendor Alloted","Return Pickup Schedule","Cancelled","Vendor Rejected","Dispatched","Re-Dispatched","Delivery Confirmed","InTransit","Return Request","Picked-Up"]
    var addingData = ["0","2","5","2","21","17","15","10","8","19","24","20","22"]
    
    //        pending = 0
    //        processed = 2
    //        rejected = 5
    //        vendorAlloted = 2
    //        returnPickupSchedule =21
    //        cancelled = 17
    //        vendorRejected = 15
    //        dispatched = 10
    //        deliveryConfirmed = 19
    //        inTransit =24
    //        returnRequest = 20
    //        pickedUp = 22
    //        reDispatched = 8
    

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
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        if self.itsFrom == "SideMenu"{
            self.backBtn.isHidden = false
        }else{
            self.backBtn.isHidden = true
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myRedemptionListing()
        
//        let collectionViewFLowLayout2 = UICollectionViewFlowLayout()
//        collectionViewFLowLayout2.itemSize = CGSize(width: CGFloat(((self.view.bounds.width - 38) - (self.collectionView.contentInset.left + self.collectionView.contentInset.right)) / 2), height: 45)
//        collectionViewFLowLayout2.minimumLineSpacing = 2.5
//        collectionViewFLowLayout2.minimumInteritemSpacing = 2.5
//         self.collectionView.collectionViewLayout = collectionViewFLowLayout2
    }
    
    
    func myRedemptionListing(){
        let parameter = [
            "ActionType": "52",
            "ActorId": "\(self.userId)",
            "ObjCatalogueDetails": [
                "JFromDate": "\(selectedFromDate)",
                "JToDate": "\(selectedToDate)",
                "SelectedStatus": "\(self.collectionViewDataNumber)"
            ]
            ]as [String: Any]
        print(parameter)
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
       // let collectionViewFLowLayout2 = UICollectionViewFlowLayout()
       // collectionViewFLowLayout2.itemSize = CGSize(width: CGFloat(((self.view.bounds.width - 38) - (self.collectionView.contentInset.left + self.collectionView.contentInset.right)) / 3), height: 30)
        //collectionViewFLowLayout2.itemSize = CGSize(width: , height: 30)
//        collectionViewFLowLayout2.minimumLineSpacing = 2.5
//        collectionViewFLowLayout2.minimumInteritemSpacing = 2.5
//         self.collectionView.collectionViewLayout = collectionViewFLowLayout2
    }
    @IBAction func closeBtn(_ sender: Any) {
        self.filterView.isHidden = true
    }
    
    @IBAction func fromDateButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
        vc!.delegate = self
        vc!.isComeFrom = "1"
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .coverVertical
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func toDateButton(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
        vc!.delegate = self
        vc!.isComeFrom = "2"
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .coverVertical
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func pendingButton(_ sender: Any) {
        self.status = "1"
        self.approvedBtn.backgroundColor = .white
        self.pendingBtn.backgroundColor = .systemOrange
        self.cancelledBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
//        self.reopenBtn.backgroundColor = .white
//        self.resolveFollowUpBtn.backgroundColor = .white
    }
    
    @IBAction func approvedButton(_ sender: Any) {
        self.status = "3"
        self.approvedBtn.backgroundColor = .systemOrange
        self.pendingBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
//        self.reopenBtn.backgroundColor = .white
//        self.resolveFollowUpBtn.backgroundColor = .white
    }
    
    @IBAction func cancelledButton(_ sender: Any) {
        self.status = "4"
        self.approvedBtn.backgroundColor = .white
        self.pendingBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .systemOrange
//        self.reopenBtn.backgroundColor = .white
//        self.resolveFollowUpBtn.backgroundColor = .white
    }
    
    @IBAction func applyButton(_ sender: Any) {
        print(status,"srjdh")
        print(self.selectedFromDate,"slkdls")
        print(selectedToDate,"lskdjsldm")
        self.filterView.isHidden = true
        self.collectionViewCatagory
        self.collectionViewDataNumber
        self.myRedemptionListing()
        
    }
    @IBAction func clearbtn(_ sender: Any) {
        self.status = ""
        self.collectionViewCatagory = ""
        self.fromDateBtn.setTitle("From Date", for: .normal)
        self.toDateBtn.setTitle("To Date", for: .normal)
        self.approvedBtn.backgroundColor = .white
        self.pendingBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.filterView.isHidden = true
    }
   
}

extension FG_MyRedemptionVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate,UICollectionViewDataSource{
 

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyRedemptionTVC", for: indexPath) as! FG_MyRedemptionTVC
        cell.selectionStyle = .none
        cell.categoryTitleLbl.text = VM.myRedemptionList[indexPath.row].productName ?? ""
        //cell.refNoTitleLbl.text = "Ref.No"
        cell.refNoLbl.text = VM.myRedemptionList[indexPath.row].redemptionRefno
        cell.qtyLbl.text = "\(VM.myRedemptionList[indexPath.row].quantity ?? 0)"
//        let date = (VM.myRedemptionList[indexPath.row].jRedemptionDate ?? "").split(separator: " ")
//        cell.dateTitleLbl.text = "\(date[0])"
//        cell.ptsLbl.text = "\(VM.myRedemptionList[indexPath.row].redeemedPoints ?? 0)"
        
        let date = (VM.myRedemptionList[indexPath.row].jRedemptionDate ?? "").split(separator: " ")
        //let dateFormate = convertDateFormaterString("\(date[0])", fromDate: "MM-dd-yyyy", toDate: "dd/MM/yyyy")
        let convertDateFormate = self.convertDateFormaterString("\(date[0])", fromDate: "MM-dd-yyyy", toDate: "dd/MM/yyyy")
        cell.dateTitleLbl.text = "\(convertDateFormate)"
        cell.ptsLbl.text = "\(Int(VM.myRedemptionList[indexPath.row].redeemedPoints ?? 0))"
        
        
        
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
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myRedemptionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FG_RedemptionCollectionCVC", for: indexPath) as! FG_RedemptionCollectionCVC
        
        cell.collectionDataLbl.text = "\(self.collectionData[indexPath.row])    "
        cell.collectionDataLbl.textAlignment = .center
        cell.collectionDataLbl.borderColor = .lightGray
        cell.collectionDataLbl.layer.cornerRadius = 10
        cell.collectionDataLbl.layer.shadowOffset = CGSize()
        cell.collectionDataLbl.layer.shadowRadius = 0.3
        cell.collectionDataLbl.borderWidth = 1
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.collectionViewCatagory = self.collectionData[indexPath.row]
//        print(self.collectionViewCatagory,"sdlkdhskdjh")
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionViewCatagory = self.collectionData[indexPath.row]
        self.collectionViewDataNumber = self.addingData[indexPath.row]
        print(self.collectionViewCatagory,"sdlkdhskdjh")
        print(self.collectionViewDataNumber,"lxkjdlsm")

//        pending = 0
//        processed = 2
//        rejected = 5
//        vendorAlloted = 2
//        returnPickupSchedule =21
//        cancelled = 17
//        vendorRejected = 15
//        dispatched = 10
//        deliveryConfirmed = 19
//        inTransit =24
//        returnRequest = 20
//        pickedUp = 22
//        reDispatched = 8
        
    }
    
}
