//
//  FG_MyBillingsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_MyBillingsVC: BaseViewController,myBillingsDelegate {
    
    
    func billingDelegate(_ cell: FG_MyBillingTVC) {
        guard let tappedIndexPath = self.myBillingsTableView.indexPath(for: cell) else{return}
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyBillingDetailsVC") as! FG_MyBillingDetailsVC
        vc.invoiceNumber = "\(VM.myBillingsListingArray[tappedIndexPath.row].invoiceNo ?? "")"
        vc.ordernumber = "\(VM.myBillingsListingArray[tappedIndexPath.row].ordreNumber ?? "")"
        vc.orderDate = "\(VM.myBillingsListingArray[tappedIndexPath.row].tranDate ?? "")"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBOutlet weak var myBillingsTableView: UITableView!
    @IBOutlet weak var noDataFound: UILabel!
    @IBOutlet var billingHeaderStack: UIStackView!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var VM = MyBillingVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self

        self.myBillingsTableView.delegate = self
        self.myBillingsTableView.dataSource = self
        billingsListingAPI()
        
        
        self.billingHeaderStack.clipsToBounds = true
        billingHeaderStack.layer.cornerRadius = 15
        billingHeaderStack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
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
                "JFromDate":"",
                "JToDate":""
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
