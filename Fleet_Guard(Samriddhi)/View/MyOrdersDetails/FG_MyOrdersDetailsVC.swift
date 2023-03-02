//
//  FG_MyOrdersDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 21/02/23.
//

import UIKit

class FG_MyOrdersDetailsVC: BaseViewController {
    
    @IBOutlet var myOrdersHeaderLbl: UILabel!
    @IBOutlet var languageChangeOutBtn: UIButton!
    @IBOutlet var notificationOutBtn: UIButton!
    @IBOutlet var notificationCountLbl: UILabel!
    
    @IBOutlet var orderNumberHeadingLbl: UILabel!
    @IBOutlet var orderNumberLbl: UILabel!
    
    @IBOutlet var orderDateHeadingLbl: UILabel!
    @IBOutlet var orderDateLbl: UILabel!
    
    @IBOutlet var orderView: UIView!
    @IBOutlet var orderDetailsTV: UITableView!
    
    @IBOutlet var noDataFoundLbl: UILabel!
    
    
    var ordernumber = ""
    var orderDate = ""
    
    var VM = MyOrderDetailsListingVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.orderDetailsTV.delegate = self
        self.orderDetailsTV.dataSource = self
        self.orderDetailsTV.separatorStyle = .none
        self.myOrderDetailsAPI()
        self.orderNumberHeadingLbl.text = "Order No"
        self.orderDateHeadingLbl.text = "Order Date"
        self.orderDateLbl.text = orderDate
        self.orderNumberLbl.text = ordernumber
    }

    func myOrderDetailsAPI() {
        let parameters = [
            "ActionType": 19,
            "ActorId": "\(userId)",
            "OrderStatus": -2,
            "JFromDate": "",
            "JToDate": "",
            "OrderNumber": "\(ordernumber)"
        ] as [String: Any]
        self.VM.myOrderDetailsListingAPI(parameters: parameters)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        //self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

}

extension FG_MyOrdersDetailsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myOrderListingDetailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyOrdersDeatilsTVC") as! FG_MyOrdersDeatilsTVC
        cell.selectionStyle = .none
        cell.productHeadingLbl.text = VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].productName ?? "-"
        cell.partNoLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].prodCode ?? "-")"
        cell.orderQTYLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].quantity ?? 0)"
        cell.dispatchQtyLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].productStockQuantity ?? 0)"
        cell.statusLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].statusName ?? "")"
        
        if (indexPath.row) % 2 == 0{
            cell.productView.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8196078431, alpha: 1)
        }else{
            cell.productView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    
}

