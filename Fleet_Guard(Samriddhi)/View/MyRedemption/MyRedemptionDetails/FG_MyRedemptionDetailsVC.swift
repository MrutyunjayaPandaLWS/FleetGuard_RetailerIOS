//
//  EBC_MyRedeemptionDetailsVC.swift
//  EuroBond_Customer
//
//  Created by syed on 28/03/23.
//

import UIKit
import LanguageManager_iOS
import Kingfisher

class FG_MyRedemptionDetailsVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var pointsBalLbl: UILabel!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var orderStatusTV: UITableView!
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var cartNumber: UILabel!
    @IBOutlet weak var eurosTitleLbl: UILabel!
    @IBOutlet weak var cartBalanceLbl: UILabel!
    @IBOutlet weak var cancelOrderBtn: UIButton!
    @IBOutlet weak var OrderStatusTitleLbl: UILabel!
    @IBOutlet weak var productBalLbl: UILabel!
    @IBOutlet weak var eurosTitle1: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var termAndConditionLbl: UILabel!
    @IBOutlet weak var termAndConditionTitle: UILabel!
    @IBOutlet weak var descriptionDetailsLbl: UILabel!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var quantityTitle: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDate: UILabel!
    @IBOutlet weak var redemptionRefno: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var VCtitle: UILabel!
    var redepmtionId = ""
    var productRefno = ""
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var VM = FG_RedemptionDetailsVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        orderStatusTV.delegate = self
        orderStatusTV.dataSource = self
        cancelOrderBtn.isHidden = true
        emptyMessage.isHidden = true
        emptyMessage.text = "noDataFound".localiz()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myRedemptionDetailsApi()
        localization()
    }
    

    private func localization(){
        self.VCtitle.text = "My_Redemption".localiz()
    }
    
    
    @IBAction func selectBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectMyCartBtn(_ sender: UIButton) {
    }
    
    @IBAction func selectOrderCancelBtn(_ sender: UIButton) {
    }
    
    func myRedemptionDetailsApi(){
        let parameter : [String : Any] = [
            "ActionType": "53",
            "ActorId": userId,
            "ObjCatalogueDetails": [
                "RedemptionId": redepmtionId
            ]
        ]
        self.VM.redemptionDetailsApi(parameter: parameter)
        
    }
    
    func orderStatusApi(){
        let parameter : [String : Any] = [
            
                "ActionType": 263,
                "ActorId": userId,
                "ObjCatalogueDetails": [
                    "RedemptionRefno": productRefno
                ]
            
        ]
        self.VM.orderStatusListApi(parameter: parameter)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewHeight.constant = CGFloat(self.VM.orderStatusArrayList.count*34)
        return self.VM.orderStatusArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyRedemptionDetailsTVC", for: indexPath) as! FG_MyRedemptionDetailsTVC

        var statusDtata = self.VM.orderStatusArrayList[indexPath.row].status ?? 0
        if statusDtata == 0{
            cell.oderStatusLbl.text = "Pending"
        }else if statusDtata == 12{
            cell.oderStatusLbl.text = "Processd"
        }else if statusDtata == 14{
            cell.oderStatusLbl.text = "Processd"
        }else if statusDtata == 2{
            cell.oderStatusLbl.text = "Processd"
        }else if statusDtata == 15{
            cell.oderStatusLbl.text = "Processd"
        }else if statusDtata == 10{
            cell.oderStatusLbl.text = "Dispatched"
        }else if statusDtata == 4{
            cell.oderStatusLbl.text = "Delivered"
        }else if statusDtata == 24{
            cell.oderStatusLbl.text = "In Transit"
        }else if statusDtata == 19{
            cell.oderStatusLbl.text = "Delivery Confirmed"
        }else if statusDtata == 20{
            cell.oderStatusLbl.text = "Return Requested"
        }else if statusDtata == 21{
            cell.oderStatusLbl.text = "Return Pickup Schedule"
        }else if statusDtata == 22{
            cell.oderStatusLbl.text = "Picked Up"
        }else if statusDtata == 23{
            cell.oderStatusLbl.text = "Return Received"
        }else if statusDtata == 8{
            cell.oderStatusLbl.text = "Redispatched"
        }else if statusDtata == 3{
            cell.oderStatusLbl.text = "Cancelled"
        }else {
            cell.oderStatusLbl.text = "Rejected"
        }
        
        if indexPath.row == self.VM.orderStatusArrayList.count - 1{
            cell.bottomLine.isHidden = true
        }
        cell.selectionStyle = .none
        
        cell.oderDate.text = self.VM.orderStatusArrayList[indexPath.row].createdDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 34
    }
    
    
    

}
