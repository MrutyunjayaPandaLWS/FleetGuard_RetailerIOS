//
//  FG_ProductCatalogueDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit

class FG_ProductCatalogueDetailsVC: BaseViewController, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    

    @IBOutlet weak var cartCountLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var orderNowStackView: UIStackView!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var partNoLbl: UILabel!
    @IBOutlet weak var dapValue: UILabel!
    @IBOutlet weak var shortDescLbl: UILabel!
    
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var mrpValue: UILabel!
    
    @IBOutlet weak var qtyTF: UITextField!
    @IBOutlet weak var productQuantityView: UIStackView!
    
    @IBOutlet weak var addToCartView: UIStackView!
    
    @IBOutlet weak var addToDreamGfit: UIButton!
    
    var productImageURL = ""
    var productName = ""
    var partNo = ""
    var shortDesc = ""
    var dap = ""
    var mrp = ""
    
    var cateogryId = ""
    var productId = ""
    var quantity = "1"
    var customerCartId = ""
    var productDesc = ""
    
    var VM = FG_ProductDetailsVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var totalPoints = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
    var value = 1
  var rowTotalPrice = 0
    var totalRedeemabelPts = 0
    var productQty = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.productNameLbl.text = self.productName
        self.partNoLbl.text = self.partNo
        self.shortDescLbl.text = "\(self.productDesc)"
        self.dapValue.text = self.dap
        self.mrpValue.text = self.mrp
        self.productQuantityView.isHidden = true
        self.addToCartView.isHidden = false
        self.orderNowStackView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.myCartApi()
      //  self.productListApi()
        self.qtyTF.isEnabled = false
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func addToCartButton(_ sender: Any) {
        if self.addToCartView.isHidden == false{
            self.productQuantityView.isHidden = false
            self.addToCartView.isHidden = true
            print(Int(self.totalPoints))
            print((self.mrp))
            if Int(self.mrp ) ?? 0 <= Int(self.totalPoints )!{
                let parameter = [
                    "ActionType": "3",
                    "ActorId": "\(self.userId)",
                    "LoyaltyID": "\(self.loyaltyId)",
                    "MerchantId": "1",
                    "ProductSaveDetailList": [
                        [
                            "CategoryId": "4",
                            "ProductId": "\(self.productId)",
                            "Quantity": "\(self.quantity)"
                        ]
                    ]
                ] as [String: Any]
                print(parameter)
                self.VM.addToCartApi(parameter: parameter)
            }else{
//                DispatchQueue.main.async{
//                   let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                    vc!.descriptionInfo = "Insufficient point balance"
//                    vc!.modalPresentationStyle = .overFullScreen
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
//                }
                self.view.makeToast("Insufficient point balance", duration: 3.0, position: .bottom)
            }
        }
        
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        if self.value > 1{
            self.value -= 1
            self.quantity = "\(value)"
            self.qtyTF.text = self.quantity
            self.productQuantityUpdate()
        }else{
            self.value = 1
            self.quantity = "1"
            self.qtyTF.text = self.quantity
        }
       
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        let calcValues = self.rowTotalPrice * Int(self.productQty)
        print(calcValues)
        print(totalRedeemabelPts,"dkjshj")
        let calcExisting =  self.totalRedeemabelPts - calcValues
        print(calcExisting)
        
        if self.value < 1{
            self.value = 1
            self.quantity = "1"
            let calcValue = self.rowTotalPrice * self.value
            print(calcValue)
            let finalValue = calcValue + calcExisting
            print(finalValue)
            //if finalValue <= Int(self.totalPoints) ?? 0{
                self.qtyTF.text = self.quantity
                self.productQuantityUpdate()
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
            
            
        }else{
            self.value += 1
            self.quantity = "\(value)"
            print(self.value)
            let calcValue = self.rowTotalPrice * self.value
            print(calcValue)
            let finalValue = calcValue + calcExisting
            print(finalValue)
           // if finalValue <= Int(self.totalPoints) ?? 0{
                self.qtyTF.text = self.quantity
                self.productQuantityUpdate()
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
    
    @IBAction func quantityFieldEditingDidEnd(_ sender: Any) {
    }
    
    
    
    @IBAction func addToDreamGiftBtn(_ sender: Any) {
    }
    
    
    @IBAction func orderNowButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueMyCartVC") as! FG_ProductCatalogueMyCartVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addMorePartNoButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func myCartBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueMyCartVC") as! FG_ProductCatalogueMyCartVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func myCartApi(){
        let parameter = [
              "ActionType": "9",
              "LoyaltyId": "\(self.loyaltyId)",
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
    
    func productListApi(){
        let parameter = [
                "ActionType": "12",
                "ActorId": "\(self.userId)",
                "SearchText": "",
                "LoyaltyID": "\(self.loyaltyId)",
                "ProductDetails": [
                    "BrandId": 0,
                    "Cat1": 0,
                    "Cat2": 0,
                    "NlStatus": "NEW",
                    "SkuMaxPrice": 0,
                    "SkuMinPrice": 0
                ]
            
        ] as [String: Any]
        print(parameter)
        self.VM.productListApi(parameter: parameter)
    }
    
    func productQuantityUpdate(){
        let parameter = [
                "ActionType": "7",
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
    
}
