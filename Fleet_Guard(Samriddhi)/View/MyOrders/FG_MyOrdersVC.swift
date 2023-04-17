//
//  FG_MyOrdersVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_MyOrdersVC: BaseViewController,myOrderDelegate, DateSelectedDelegate {
    
    func acceptDate(_ vc: FG_DOBVC) {
        if vc.isComeFrom == "1"{
            self.selectedFromDate = vc.selectedDate
            self.fromDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
        }else{
            self.selectedToDate = vc.selectedDate
            self.toDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
        }
        if selectedFromDate >= selectedToDate {
            self.view.makeToast("Please enter to date less the from date", duration: 3.0, position: .bottom)
        }else{
            self.myOrderListingAPI(startInx: 1, orderStatusId: -1, fromDate: "\(selectedFromDate)", toDate: "\(selectedToDate)")
        }
    }
    func declineDate(_ vc: FG_DOBVC) {
        self.dismiss(animated: true)
    }
    func myOrderDelegate(_ cell: FG_MyOrderTVC) {
        guard let tappedIndexPath = self.myOrderTableView.indexPath(for: cell) else{return}
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyOrdersDetailsVC") as! FG_MyOrdersDetailsVC
        vc.ordernumber = "\(VM.myOrderListingArray[tappedIndexPath.row].orderNo ?? "")"
        let date = VM.myOrderListingArray[tappedIndexPath.row].orderDate ?? "-"
        let splitDate = date.split(separator: " ")
        vc.orderDate = String(splitDate[0])//getRequiredDate(fromFormate: "MM/dd/yyyy", toFormate: "dd-MM-yyyy", dateString:"\(splitDate[0])")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBOutlet weak var fromDateBtn: UIButton!

    @IBOutlet weak var toDateBtn: UIButton!

    @IBOutlet weak var myOrderTableView: UITableView!
    @IBOutlet weak var noDataFound: UILabel!
    @IBOutlet var orderHeaderStack: UIStackView!
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    
    @IBOutlet weak var filterClickBTN: UIButton!
    
    @IBOutlet weak var approvedBtn: UIButton!
    @IBOutlet weak var pendingBtn: UIButton!
    @IBOutlet weak var rejectedBtn: UIButton!
    @IBOutlet weak var escalatedBtn: UIButton!
    @IBOutlet weak var cancelledBtn: UIButton!
    @IBOutlet weak var postedForApprovalBtn: UIButton!
    
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    
    var VM = MyOrderListingVM()
    var noofelements = 0
    var startindex = 1
    var selectedQueryTopic = ""
    var selectedQueryTopicId = -1
    var selectedStatusId = -1
    var selectedFromDate = ""
    var selectedToDate = ""
    var status = 0
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.myOrderTableView.delegate = self
        self.myOrderTableView.dataSource = self
        self.myOrderListingAPI(startInx: 1, orderStatusId: -1, fromDate: "", toDate: "")
        self.subView.isHidden = true
        //self.filterView.isHidden = true
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 20
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        filterView.clipsToBounds = true
        filterView.layer.cornerRadius = 20
        filterView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.orderHeaderStack.clipsToBounds = true
        orderHeaderStack.layer.cornerRadius = 15
        orderHeaderStack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    


    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func filterBtn(_ sender: Any) {
        if self.subView.isHidden == false{
            self.subView.isHidden = true
        }else{
            self.subView.isHidden = false
            self.approvedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
            self.pendingBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
            self.rejectedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
            self.escalatedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
            self.cancelledBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
            self.postedForApprovalBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
            self.approvedBtn.backgroundColor = .white
            self.pendingBtn.backgroundColor = .white
            self.rejectedBtn.backgroundColor = .white
            self.escalatedBtn.backgroundColor = .white
            self.cancelledBtn.backgroundColor = .white
            self.postedForApprovalBtn.backgroundColor = .white
        }
}
@IBAction func closeBtn(_ sender: Any) {
    self.subView.isHidden = true
}
    
    @IBAction func applyButton(_ sender: Any) {
        print(status,"srjdh")
        print(self.selectedFromDate,"slkdls")
        print(selectedToDate,"lskdjsldm")
//        self.queryListApi(queryTopic: self.selectedQueryTopicId, statusId: self.selectedStatusId, StartIndex: startindex)
        self.VM.myOrderListingArray.removeAll()
        self.myOrderListingAPI(startInx: startindex, orderStatusId: self.status, fromDate: self.selectedFromDate, toDate: self.selectedToDate)
        self.subView.isHidden = true
    }
    @IBAction func clearbtn(_ sender: Any) {
        
        self.status = -1
        self.fromDateBtn.setTitle("From Date", for: .normal)
        self.toDateBtn.setTitle("To Date", for: .normal)
        self.selectedFromDate = ""
        self.selectedToDate = ""
        
//        self.approvedBtn.backgroundColor = .white
//        self.pendingBtn.backgroundColor = .white
//        self.cancelledBtn.backgroundColor = .white
//        self.reopenBtn.backgroundColor = .white
//        self.resolveFollowUpBtn.backgroundColor = .white
        self.subView.isHidden = true
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
    
    @IBAction func PendingBTNAct(_ sender: Any) {
        self.status = 3
        self.searchText = "Pending"
        self.approvedBtn.setTitleColor(.white, for: .normal)
        self.pendingBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.rejectedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.escalatedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.cancelledBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.postedForApprovalBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.approvedBtn.backgroundColor = #colorLiteral(red: 0.7769741416, green: 0.6255683899, blue: 0.3665126264, alpha: 1)
        self.pendingBtn.backgroundColor = .white
        self.rejectedBtn.backgroundColor = .white
        self.escalatedBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.postedForApprovalBtn.backgroundColor = .white
        
    }
    
    @IBAction func fulfilledBTN(_ sender: Any) {
        self.status = 1
        self.searchText = "Fulfiled"
        self.pendingBtn.setTitleColor(.white, for: .normal)
        self.approvedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.rejectedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.escalatedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.cancelledBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.postedForApprovalBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.pendingBtn.backgroundColor = #colorLiteral(red: 0.7769741416, green: 0.6255683899, blue: 0.3665126264, alpha: 1)
        self.approvedBtn.backgroundColor = .white
        self.rejectedBtn.backgroundColor = .white
        self.escalatedBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.postedForApprovalBtn.backgroundColor = .white
    }
    
    @IBAction func cancelActBTN(_ sender: Any) {
        self.searchText = "Cancelled"
        self.rejectedBtn.setTitleColor(.white, for: .normal)
        self.pendingBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.approvedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.escalatedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.cancelledBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.postedForApprovalBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.rejectedBtn.backgroundColor = #colorLiteral(red: 0.7769741416, green: 0.6255683899, blue: 0.3665126264, alpha: 1)
        self.pendingBtn.backgroundColor = .white
        self.approvedBtn.backgroundColor = .white
        self.escalatedBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.postedForApprovalBtn.backgroundColor = .white
    }
    
    @IBAction func escalatedButton(_ sender: Any) {
        self.searchText = "Partially Fulfilled"
        self.escalatedBtn.setTitleColor(.white, for: .normal)
        self.pendingBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.rejectedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.approvedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.cancelledBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
        self.postedForApprovalBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
       
        self.escalatedBtn.backgroundColor = #colorLiteral(red: 0.7769741416, green: 0.6255683899, blue: 0.3665126264, alpha: 1)
        
        self.pendingBtn.backgroundColor = .white
        self.rejectedBtn.backgroundColor = .white
        self.approvedBtn.backgroundColor = .white
        self.cancelledBtn.backgroundColor = .white
        self.postedForApprovalBtn.backgroundColor = .white
    }
    
//    @IBAction func cancelledButton(_ sender: Any) {
//        self.cancelledBtn.setTitleColor(.white, for: .normal)
//        self.pendingBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.rejectedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.escalatedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.approvedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.postedForApprovalBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//
//        self.cancelledBtn.backgroundColor = #colorLiteral(red: 0.7769741416, green: 0.6255683899, blue: 0.3665126264, alpha: 1)
//        self.pendingBtn.backgroundColor = .white
//        self.rejectedBtn.backgroundColor = .white
//        self.escalatedBtn.backgroundColor = .white
//        self.approvedBtn.backgroundColor = .white
//        self.postedForApprovalBtn.backgroundColor = .white
//    }
//
//    @IBAction func postedForApprovalButton(_ sender: Any) {
//        self.postedForApprovalBtn.setTitleColor(.white, for: .normal)
//        self.pendingBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.rejectedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.escalatedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.cancelledBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//        self.approvedBtn.setTitleColor(#colorLiteral(red: 0.1750419736, green: 0.2154744267, blue: 0.4999932051, alpha: 1), for: .normal)
//
//
//        self.postedForApprovalBtn.backgroundColor = #colorLiteral(red: 0.7769741416, green: 0.6255683899, blue: 0.3665126264, alpha: 1)
//        self.pendingBtn.backgroundColor = .white
//        self.rejectedBtn.backgroundColor = .white
//        self.escalatedBtn.backgroundColor = .white
//        self.cancelledBtn.backgroundColor = .white
//        self.approvedBtn.backgroundColor = .white
//    }
    
    //{"ActionType":18,"ActorId":72307,"JFromDate":"","PageIndex":1,"PageSize":20,"JToDate":"","OrderStatus":0,"ProductId":"1"}
    func myOrderListingAPI(startInx:Int, orderStatusId: Int, fromDate: String, toDate: String){
        let parameters = [
            "ActionType": 18,
            "ActorId": "\(userId)",
            "OrderStatus": orderStatusId,
            "JFromDate": fromDate,
            "JToDate": toDate,
            "PageIndex": "\(startInx)",
            "PageSize": 20,
            "searchText":"\(self.searchText)"
            
        ] as [String: Any]
        print(parameters)
        self.VM.myOrderListingAPI(parameters: parameters)
    }
    
    func getRequiredDate(fromFormate:String,toFormate:String,dateString:String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromFormate
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = toFormate
        guard let date = dateFormatterGet.date(from: dateString) else {
            return  "-"  }
        return dateFormatterPrint.string(from: date)
    }
    
}
extension FG_MyOrdersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myOrderListingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyOrderTVC", for: indexPath) as! FG_MyOrderTVC
        cell.delegate = self
        cell.statusLbl.text = VM.myOrderListingArray[indexPath.row].orderStatus ?? "-"
        cell.sourceLbl.text = VM.myOrderListingArray[indexPath.row].sourceMode
        cell.myOrderLbl.text = "\(VM.myOrderListingArray[indexPath.row].orderNo ?? "")"
        let date = VM.myOrderListingArray[indexPath.row].orderDate ?? "-"
        let splitDate = date.split(separator: " ")
        //cell.orderDateLbl.text = getRequiredDate(fromFormate: "MM/dd/yyyy", toFormate: "dd-MM-yyyy", dateString:"\(splitDate[0])")
        cell.orderDateLbl.text = "\(splitDate[0])"
        if (indexPath.row) % 2 == 0{
            cell.orderIndexStackView.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 1)
        }else{
            cell.orderIndexStackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
        return  cell
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == VM.myOrderListingArray.count - 2{
                if noofelements == 20{
                    startindex = startindex + 1
                    self.myOrderListingAPI(startInx: startindex, orderStatusId: self.status, fromDate: self.selectedFromDate, toDate: self.selectedToDate)
                }else if noofelements > 20{
                    startindex = startindex + 1
                    self.myOrderListingAPI(startInx: startindex, orderStatusId: self.status, fromDate: self.selectedFromDate, toDate: self.selectedToDate)
                }else if noofelements < 20{
                    return
                }else{
                    print("n0 more elements")
                    return
                }
            }
        }
    
}
