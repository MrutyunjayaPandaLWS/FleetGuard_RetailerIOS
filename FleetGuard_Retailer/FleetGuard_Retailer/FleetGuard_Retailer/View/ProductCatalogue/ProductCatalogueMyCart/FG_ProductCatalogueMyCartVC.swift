//
//  FG_ProductCatalogueMyCartVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_ProductCatalogueMyCartVC: BaseViewController, MyCartButtonActionDelegate, popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    @IBOutlet weak var totalRedeemabelPtsLbL: UILabel!
    @IBOutlet weak var processToCheckoutView: UIView!
    @IBOutlet weak var noDataFoundLbl: UILabel!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var prodCatalogueCartTableView: UITableView!
    
    @IBOutlet var placeOrderOutBtn: UIButton!
    @IBOutlet var orderTotalLbl: UILabel!
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var customerCartId = ""
    var quantity = "1"
    var totalPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
    var productId = ""
   
    var VM = FG_ProductMyCartVM()
    var productCalcValue = 0
    var value = 1
    var totalRedeemabelPts = 0
    var cartDetailsArray = [[String: Any]]()
    
    
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
            headerText.text = "myCart".localiz()
            self.noDataFoundLbl.text = "noDataFound".localiz()
            noDataFoundLbl.isHidden = true
            self.prodCatalogueCartTableView.dataSource = self
            self.prodCatalogueCartTableView.delegate = self
            self.myCartApi()
            NotificationCenter.default.addObserver(self, selector: #selector(navigateToProductsList), name: Notification.Name.navigateToProductList, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(navigateToDashBoard), name: Notification.Name.navigateToDashboard, object: nil)
            self.orderTotalLbl.text = "Order Total"
            self.placeOrderOutBtn.setTitle("Place Order", for: .normal)
        }
    }
    

    
    @objc func navigateToProductsList(){
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: FG_ProductCatalogueListVC.self) {
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
    }
    @objc func navigateToDashBoard(){
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func processToCheckoutBtn(_ sender: Any) {
        self.placeOrderSubmissionApi()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func myCartApi(){
        let parameter = [
                "ActionType": "9",
                "LoyaltyId": "\(self.loyaltyId )",
                "CartProductDetails": [
                    "CategoryId": "0",
                    "SubCategoryId": "0",
                    "BrandId": "0",
                    "OrderSchemeID": "0"
                ]
        
        ] as [String: Any]
        print(parameter)
        self.VM.mycartListAPi(parameter: parameter)
    }
    
    func productQuantityUpdate(customerCartId: String, quantity: String){
        let parameter = [
                "ActionType": "7",
                "ActorId": "\(self.userId)",
                "CustomerCartId": customerCartId,
                "CustomerCartList": [
                    [
                        "CustomerCartId": customerCartId,
                        "Quantity": quantity
                    ]
                ]
        ] as [String: Any]
        print(parameter)
        self.VM.productQtyUpdate(parameter: parameter)
    }
    
    func productRemoveInCart(productId: String, customerCartId: String){
        let parameter = [
            "CustomerCartList": [
                    [
                        "ProductId": productId,
                        "CustomerCartId":customerCartId
                    ]
                ],
                "ActionType": "8",
            "ActorId": "\(self.userId)"
        ] as [String: Any]
        print(parameter)
        self.VM.productRemoveInCartApi(parameter: parameter)
    }
    
    // Delegates:-
    
    func didTapMinusBtn(_ cell: FG_ProdMyCartTVC) {
        guard let tappedIndexPath = self.prodCatalogueCartTableView.indexPath(for: cell)else {return}
        self.value = self.VM.myCartListArray[tappedIndexPath.row].quantity ?? 0
        self.customerCartId = "\(self.VM.myCartListArray[tappedIndexPath.row].customerCartId ?? 0)"
        self.productId = "\(self.VM.myCartListArray[tappedIndexPath.row].productId ?? 0)"
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
    
    func didTapPlusBtn(_ cell: FG_ProdMyCartTVC) {
        guard let tappedIndexPath = self.prodCatalogueCartTableView.indexPath(for: cell)else {return}
        self.value = self.VM.myCartListArray[tappedIndexPath.row].quantity ?? 0
        self.customerCartId = "\(self.VM.myCartListArray[tappedIndexPath.row].customerCartId ?? 0)"
        self.productId = "\(self.VM.myCartListArray[tappedIndexPath.row].productId ?? 0)"
        let productPrice = Int(self.VM.myCartListArray[tappedIndexPath.row].rowTotalPrice ?? 0)
        let calcValues = (productPrice) * Int(self.VM.myCartListArray[tappedIndexPath.row].quantity ?? 0)
        let calcExisting =  self.totalRedeemabelPts - calcValues
        if self.value < 1{
            self.value = 1
            self.quantity = "1"
                let calcValue = Int(self.VM.myCartListArray[tappedIndexPath.row].rowTotalPrice ?? 0.0) * self.value
                let finalValue = calcValue + calcExisting
                //if finalValue <= Int(self.totalPoints)!{
                    cell.qtyTF.text = self.quantity
                    self.productQuantityUpdate(customerCartId: self.customerCartId, quantity: "\(self.value)")
//                }else{
//                    DispatchQueue.main.async{
//                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                        vc!.delegate = self
//                        vc!.descriptionInfo = "Insufficient point balance"
//                        vc!.modalPresentationStyle = .overFullScreen
//                        vc!.modalTransitionStyle = .crossDissolve
//                        self.present(vc!, animated: true, completion: nil)
//                    }
//                }
        }else{
            self.value += 1
            self.quantity = "\(value)"
            let calcValue = Int(self.VM.myCartListArray[tappedIndexPath.row].rowTotalPrice ?? 0.0) * self.value
            let finalValue = calcValue + calcExisting
           // if finalValue <= Int(self.totalPoints)!{
                cell.qtyTF.text = self.quantity
                self.productQuantityUpdate(customerCartId: self.customerCartId, quantity: "\(self.value)")
//            }else{
//                DispatchQueue.main.async{
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                    vc!.descriptionInfo = "Insufficient point balance"
//                    vc!.modalPresentationStyle = .overFullScreen
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
//                }
//            }
        }
    }
    
    func didTapRemoveBtn(_ cell: FG_ProdMyCartTVC) {
        guard let tappedIndexPath = self.prodCatalogueCartTableView.indexPath(for: cell) else {return}
        self.productId = "\(self.VM.myCartListArray[tappedIndexPath.row].productId ?? 0)"
        self.customerCartId = "\(self.VM.myCartListArray[tappedIndexPath.row].customerCartId ?? 0)"
        self.productRemoveInCart(productId: self.productId, customerCartId: self.customerCartId)
    }
    
    
    func placeOrderSubmissionApi(){
        let parameter = [
            "LoyaltyId": "\(self.loyaltyId)",
            "SourceModeId": "5",
            "ActorId": "\(self.userId)",
            "OrderStatus": "0",
            "CartDetailsList": self.cartDetailsArray,
            "ActionType": "8",
            "Remarks":""

        ] as [String: Any]
        print(parameter)
        self.VM.placeOrderSubmissionApi(parameter: parameter)
    }
    
}
extension FG_ProductCatalogueMyCartVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.VM.myCartListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_ProdMyCartTVC", for: indexPath) as! FG_ProdMyCartTVC
        cell.selectionStyle = .none
        cell.delegate = self
        cell.productNameLbl.text = self.VM.myCartListArray[indexPath.row].productName ?? ""
        cell.ptsLbl.text = "\(self.VM.myCartListArray[indexPath.row].rowTotalPrice ?? 0)"
        cell.mrpLbl.text = "\(self.VM.myCartListArray[indexPath.row].mrp ?? 0.0)"
        cell.dapLbl.text = "\(self.VM.myCartListArray[indexPath.row].rowTotalPrice ?? 0)"
        cell.partNoLbl.text = self.VM.myCartListArray[indexPath.row].prodCode ?? ""
        cell.qtyTF.text = "\(self.VM.myCartListArray[indexPath.row].quantity ?? 0)"
        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
}
