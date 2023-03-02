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
    }
    func billingsListingAPI() {
        let parametets = [
            "ActionType":12,
            "ActorId":"\(userId)",
            "ApprovalStatusID":-2
        ] as [String: Any]
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
        
        return cell
    }
    
    
}
