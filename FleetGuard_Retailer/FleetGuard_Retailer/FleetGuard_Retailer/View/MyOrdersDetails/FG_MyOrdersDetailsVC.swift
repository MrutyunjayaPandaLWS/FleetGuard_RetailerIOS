//
//  FG_MyOrdersDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 21/02/23.
//

import UIKit
import LanguageManager_iOS
import Kingfisher

class FG_MyOrdersDetailsVC: BaseViewController, DateSelectedDelegate {
    func acceptDate(_ vc: FG_DOBVC) {
        if vc.isComeFrom == "1"{
            self.selectedFromDate = vc.selectedDate
           // self.fromDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
        }else{
            self.selectedToDate = vc.selectedDate
            //self.toDateBtn.setTitle("\(vc.selectedDate)", for: .normal)
        }
    }
    func declineDate(_ vc: FG_DOBVC) {
        self.dismiss(animated: true)
    }
    
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
    var selectedFromDate = ""
    var selectedToDate = ""
    
    var VM = MyOrderDetailsListingVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
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
            self.noDataFoundLbl.isHidden = true
            self.orderDetailsTV.delegate = self
            self.orderDetailsTV.dataSource = self
            self.orderDetailsTV.separatorStyle = .none
            self.myOrderDetailsAPI()
            self.orderNumberHeadingLbl.text = "Order No".localiz()
            self.orderDateHeadingLbl.text = "OrderDate".localiz()
            self.orderDateLbl.text = orderDate
            self.orderNumberLbl.text = ordernumber
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.noDataFoundLbl.text = "noDataFound".localiz()
        myOrdersHeaderLbl.text = "My_Orders".localiz()
        
    }

    func myOrderDetailsAPI() {
        let parameters = [
            "ActionType": 19,
            "ActorId": "\(userId)",
            "OrderStatus": -2,
            "JFromDate": "\(selectedFromDate)",
            "JToDate": "\(selectedToDate)",
            "OrderNumber": "\(ordernumber)"
        ] as [String: Any]
        print(parameters, "My orders details")
        self.VM.myOrderDetailsListingAPI(parameters: parameters)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        //self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
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
}

extension FG_MyOrdersDetailsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if VM.myOrderListingDetailsArray.count > 0 {
            return VM.myOrderListingDetailsArray[0].lstCustomerCartApi?.count ?? 0
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyOrdersDeatilsTVC") as! FG_MyOrdersDeatilsTVC
        cell.selectionStyle = .none
        cell.productHeadingLbl.text = VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].productName ?? "-"
        cell.partNoLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].prodCode ?? "-")"
        cell.orderQTYLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].quantity ?? 0)"
        cell.dispatchQtyLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].disPatchQty ?? 0)"
        cell.statusLbl.text = "\(VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].statusName ?? "")"

        let imageURL = VM.myOrderListingDetailsArray[0].lstCustomerCartApi?[indexPath.row].productImg ?? ""
        print(imageURL)
        if imageURL != ""{
            let filteredURLArray = imageURL
            let urltoUse = String(product_Image_Url + filteredURLArray).replacingOccurrences(of: " ", with: "%20")
            let urlt = URL(string: "\(urltoUse)")
            print(urlt)
            cell.orderDetailsImg.kf.setImage(with: URL(string: "\(String(describing: urltoUse))")!, placeholder: UIImage(named: "Image 3"));
        }
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

