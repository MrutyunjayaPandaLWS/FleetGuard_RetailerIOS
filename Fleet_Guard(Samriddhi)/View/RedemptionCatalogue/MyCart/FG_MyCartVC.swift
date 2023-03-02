//
//  FG_MyCartVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit

class FG_MyCartVC: BaseViewController, CatalogueActionDelegate, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    @IBOutlet weak var nodataFoundLbl: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var myCartTableView: UITableView!
    @IBOutlet weak var myCartLbl: UILabel!
    @IBOutlet weak var totalRedeemablePtsLbl: UILabel!
    
    
    var VM = RedemptionCatalogueMyCartVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
        //var totalPoints = UserDefaults.standard.string(forKey: "TotalPoints") ?? ""
    var totalPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
    var productCalcValue = 0
    var value = 1
    var totalRedeemabelPts = 0
    var customerCartId = ""
    var quantity = "1"
    var productId = ""
    var finalValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        myCartTableView.delegate = self
        myCartTableView.dataSource = self
        self.myCartListApi()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func processToCheckOutBtn(_ sender: Any) {
        print(totalRedeemablePtsLbl.text,"slkjdl")
        print(totalPoints,"sjhdjsk")
        print(Int(totalRedeemablePtsLbl.text ?? "") ?? 0,"dksjdkj")
        
        if Int(totalRedeemablePtsLbl.text ?? "") ?? 0 <= Int(totalPoints) ?? 0 {
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_DefaultAddressVC") as! FG_DefaultAddressVC
            vc.totalPts = self.totalRedeemabelPts
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            DispatchQueue.main.async{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                vc!.delegate = self
                vc!.descriptionInfo = "Insufficient point balance"
                vc!.modalPresentationStyle = .overFullScreen
                vc!.modalTransitionStyle = .crossDissolve
                self.present(vc!, animated: true, completion: nil)
            }
            
        }
    }
    
    
    func myCartListApi(){
        let parameter = [
            "ActionType": "2",
            "LoyaltyID": "\(self.loyaltyId)"
        ] as [String: Any]
        self.VM.redemptionCatalogueMyCartListApi(parameter: parameter)
    }
    
    func addToCartApi(catalogueId: Int){
        
        let parameter = [
            "ActionType": "1",
            "ActorId": "\(self.userId)",
            "CatalogueSaveCartDetailListRequest": [
                [
                    "CatalogueId": catalogueId,
                    "DeliveryType": "1",
                    "NoOfQuantity": "1"
                ]
            ],
            "LoyaltyID": "\(self.loyaltyId)",
            "MerchantId": "1"
        ] as [String: Any]
        print(parameter)
        self.VM.redemptionCatalogueAddToCartApi(parameter: parameter)
    }
    
    func productQuantityUpdate(customerCartId: String, quantity: String){
        let parameter = [
            "ActionType": "3",
            "ActorId": "\(self.userId)",
            "CustomerCartId": "\(self.customerCartId)",
               "CustomerCartList": [
                   [
                       "CustomerCartId": "\(self.customerCartId)",
                       "Quantity": "\(self.quantity)"
                   ]
               ]
        ] as [String: Any]
        print(parameter)
        self.VM.productQtyUpdate(parameter: parameter)
    }
    
    func productRemoveInCart(productId: String, customerCartId: String){
        let parameter = [
            "ActionType": "4",
            "ActorId": "\(self.userId)",
                "CustomerCartId": customerCartId
        ] as [String: Any]
        print(parameter)
        self.VM.productRemoveInCartApi(parameter: parameter)
    }
    
    // Delegates:-
    
    func plusBtnDidTap(_ cell: FG_MyCartTVC) {
        guard let tappedIndexPath = self.myCartTableView.indexPath(for: cell)else {return}
        self.value = self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].noOfQuantity ?? 0
        self.customerCartId = "\(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].customerCartId ?? 0)"
        self.productId = "\(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].catalogueId ?? 0)"
        let productPrice = Int(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].pointsRequired ?? 0)
        let calcValues = (productPrice) * Int(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].noOfQuantity ?? 0)
        let calcExisting =  self.totalRedeemabelPts - calcValues
        if self.value < 1{
            self.value = 1
            self.quantity = "1"
            let calcValue = Int(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].pointsRequired ?? 0) * self.value
            self.finalValue = calcValue + calcExisting
            if finalValue <= Int(self.totalPoints)!{
                cell.qtyTF.text = self.quantity
                self.productQuantityUpdate(customerCartId: self.customerCartId, quantity: "\(self.value)")
            }else{
                DispatchQueue.main.async{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                    vc!.delegate = self
                    vc!.descriptionInfo = "Insufficient point balance"
                    vc!.modalPresentationStyle = .overFullScreen
                    vc!.modalTransitionStyle = .crossDissolve
                    self.present(vc!, animated: true, completion: nil)
                }
            }
        }else{
            self.value += 1
            self.quantity = "\(value)"
            let calcValue = Int(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].pointsRequired ?? 0) * self.value
            let finalValue = calcValue + calcExisting
            if finalValue <= Int(self.totalPoints)!{
                cell.qtyTF.text = self.quantity
                self.productQuantityUpdate(customerCartId: self.customerCartId, quantity: "\(self.value)")
            }else{
                DispatchQueue.main.async{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                    vc!.delegate = self
                    vc!.descriptionInfo = "Insufficient point balance"
                    vc!.modalPresentationStyle = .overFullScreen
                    vc!.modalTransitionStyle = .crossDissolve
                    self.present(vc!, animated: true, completion: nil)
                }
            }
        }
    }
    
    func minusBtnDidTap(_ cell: FG_MyCartTVC) {
        guard let tappedIndexPath = self.myCartTableView.indexPath(for: cell)else {return}
                self.value = self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].noOfQuantity ?? 0
                self.customerCartId = "\(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].customerCartId ?? 0)"
                self.productId = "\(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].catalogueId ?? 0)"
                if self.value > 1{
                    self.value -= 1
                    self.quantity = "\(value)"
                    cell.qtyTF.text = self.quantity
                    self.productQuantityUpdate(customerCartId: self.customerCartId, quantity: "\(self.value)")
                }else{
                    self.value = 1
                    self.quantity = "1"
                    cell.qtyTF.text = self.quantity
                }
    }
    
    func removeBtnDidTap(_ cell: FG_MyCartTVC) {
        guard let tappedIndexPath = self.myCartTableView.indexPath(for: cell)else {return}
                self.productId = "\(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].catalogueId ?? 0)"
                self.customerCartId = "\(self.VM.redemptionCatalogueMyCartListArray[tappedIndexPath.row].customerCartId ?? 0)"
                self.productRemoveInCart(productId: self.productId, customerCartId: self.customerCartId)
    }
    
}
extension FG_MyCartVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.VM.redemptionCatalogueMyCartListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyCartTVC", for: indexPath) as! FG_MyCartTVC
        cell.selectionStyle = .none
        cell.delegate = self
        cell.categoryTitle.text = "Category / \(self.VM.redemptionCatalogueMyCartListArray[indexPath.row].categoryName ?? "")"
//        cell.productImage
        cell.productNameLbl.text = self.VM.redemptionCatalogueMyCartListArray[indexPath.row].productName ?? ""
        cell.pointsLbl.text = "\(self.VM.redemptionCatalogueMyCartListArray[indexPath.row].pointsRequired ?? 0)"
        cell.qtyTF.text = "\(self.VM.redemptionCatalogueMyCartListArray[indexPath.row].noOfQuantity ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
