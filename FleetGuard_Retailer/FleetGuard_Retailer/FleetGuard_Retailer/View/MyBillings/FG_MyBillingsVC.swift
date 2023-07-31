//
//  FG_MyBillingsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_MyBillingsVC: BaseViewController,myBillingsDelegate, DateSelectedDelegate {
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
        
    }
    
    
    
    func billingDelegate(_ cell: FG_MyBillingTVC) {
        guard let tappedIndexPath = self.myBillingsTableView.indexPath(for: cell) else{return}
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyBillingDetailsVC") as! FG_MyBillingDetailsVC
        vc.invoiceNumber = "\(VM.myBillingsListingArray[tappedIndexPath.row].invoiceNo ?? "")"
        vc.ordernumber = "\(VM.myBillingsListingArray[tappedIndexPath.row].ordreNumber ?? "")"
        vc.orderDate = "\(VM.myBillingsListingArray[tappedIndexPath.row].tranDate ?? "")"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBOutlet weak var viewTitleLbl: UILabel!
    @IBOutlet weak var valueTitleLbl: UILabel!
    @IBOutlet weak var invoiceDateTitleLbl: UILabel!
    @IBOutlet weak var invoiceNoTitleLbl: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var toDateBtn: UIButton!
    @IBOutlet weak var fromDateBtn: UIButton!
    @IBOutlet weak var filterTitleLbl: UILabel!
    @IBOutlet weak var filterShadowView: UIView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var myBillingsTableView: UITableView!
    @IBOutlet weak var noDataFound: UILabel!
    @IBOutlet var billingHeaderStack: UIStackView!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var VM = MyBillingVM()
    var selectedFromDate = ""
    var selectedToDate = ""
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
            self.myBillingsTableView.delegate = self
            self.myBillingsTableView.dataSource = self
            noDataFound.isHidden = true
            billingsListingAPI()
            self.filterShadowView.isHidden = true
            self.fromDateBtn.setTitle("Fromdate".localiz(), for: .normal)
            self.toDateBtn.setTitle("Todate".localiz(), for: .normal)
            self.billingHeaderStack.clipsToBounds = true
            billingHeaderStack.layer.cornerRadius = 15
            billingHeaderStack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedToDate != ""{
            self.toDateBtn.setTitle("\(selectedToDate)", for: .normal)
        }else{
            self.toDateBtn.setTitle("Todate".localiz(), for: .normal)
        }
        if selectedFromDate != ""{
            self.fromDateBtn.setTitle("\(selectedFromDate)", for: .normal)
        }else{
            self.fromDateBtn.setTitle("Fromdate".localiz(), for: .normal)
        }
        localization()
    }
    
    
    private func localization(){
        noDataFound.text = "noDataFound".localiz()
        headerLbl.text = "My_Billings".localiz()
        self.filterTitleLbl.text = "Filter".localiz()
        self.clearBtn.setTitle("Clear_all".localiz(), for: .normal)
        self.applyBtn.setTitle("Apply".localiz(), for: .normal)
        self.viewTitleLbl.text = "View".localiz()
        self.invoiceNoTitleLbl.text = "Invoice No".localiz()
        self.invoiceDateTitleLbl.text = "Invoice Date".localiz()
        self.valueTitleLbl.text = "Value".localiz()
    }
    
    @IBAction func didTappedFilterBtn(_ sender: Any) {
        self.filterShadowView.isHidden = false
    }
    
    
    @IBAction func didTappedCloseFilterBtn(_ sender: UIButton) {
        self.filterShadowView.isHidden = true
    }
    
    
    @IBAction func didTappedFromDateBtn(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
        vc!.delegate = self
        vc!.isComeFrom = "1"
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .coverVertical
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func didTappedToDateBtn(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DOBVC") as? FG_DOBVC
        vc!.delegate = self
        vc!.isComeFrom = "2"
        vc!.modalPresentationStyle = .overCurrentContext
        vc!.modalTransitionStyle = .coverVertical
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func didTappedClearBtn(_ sender: UIButton) {
        self.fromDateBtn.setTitle("Fromdate".localiz(), for: .normal)
        self.toDateBtn.setTitle("Todate".localiz(), for: .normal)
        selectedFromDate = ""
        selectedToDate = ""
        self.VM.myBillingsListingArray.removeAll()
        self.myBillingsTableView.reloadData()
        billingsListingAPI()
        
    }
    
    @IBAction func didTappedApplyBtn(_ sender: UIButton) {
        if self.fromDateBtn.currentTitle == "Fromdate".localiz() && self.toDateBtn.currentTitle == "Todate".localiz(){
            self.view.makeToast("Select From Date".localiz(), duration: 2.0, position: .center)
        }else if self.fromDateBtn.currentTitle != "Fromdate".localiz() && self.toDateBtn.currentTitle == "Todate".localiz(){
            
            self.view.makeToast("Select To Date".localiz(), duration: 2.0, position: .center)
            
        }else if self.fromDateBtn.currentTitle == "Fromdate".localiz() && self.toDateBtn.currentTitle != "Todate".localiz(){
            
            self.view.makeToast("Select From Date".localiz(), duration: 2.0, position: .center)
            
        }else{
            
            if selectedToDate < selectedFromDate{
                
                self.view.makeToast("ToDate should be lower than FromDate".localiz(), duration: 2.0, position: .center)
                
            }else{
                self.VM.myBillingsListingArray.removeAll()
                self.myBillingsTableView.reloadData()
                billingsListingAPI()
                self.filterShadowView.isHidden = true
            }
        }
    }
    
    
    //    func billingsListingAPI() {
//        let parametets = [
//            "ActionType":12,
//            "ActorId":"\(userId)",
//            "ApprovalStatusID":-2
//        ] as [String: Any]
//        self.VM.billingsListingAPI(parameters: parametets)
//    }
    
    //{"ActionType":22,"ActorId":72307,"ApprovalStatusID":-1,"JFromDate":"","JToDate":""}
        func billingsListingAPI() {
            let parametets = [
                "ActionType": 22,
                "ActorId": "\(userId)",
                "ApprovalStatusID":-1,
                "JFromDate":"\(selectedFromDate)",
                "JToDate":"\(selectedToDate)"
            ] as [String: Any]
            print(parametets)
            self.VM.billingsListingAPI(parameters: parametets)
        }
    
    
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
extension FG_MyBillingsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myBillingsListingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyBillingTVC", for: indexPath) as! FG_MyBillingTVC
        cell.delegate = self
        cell.viewBtn.setTitle("View".localiz(), for: .normal)
        cell.totalValueLbl.text = "\(VM.myBillingsListingArray[indexPath.row].totalEarnPoint ?? 0)"
        cell.invoiceNoLbl.text = VM.myBillingsListingArray[indexPath.row].invoiceNo ?? "-"
        cell.invoiceDateLbl.text = VM.myBillingsListingArray[indexPath.row].tranDate ?? "-"
        cell.totalValueLbl.text = VM.myBillingsListingArray[indexPath.row].sellingPrice ?? "-"
        
        
        
//        if (indexPath.row) % 2 == 0{
//            cell.orderIndexStackView.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 1)
//        }else{
//            cell.orderIndexStackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}
