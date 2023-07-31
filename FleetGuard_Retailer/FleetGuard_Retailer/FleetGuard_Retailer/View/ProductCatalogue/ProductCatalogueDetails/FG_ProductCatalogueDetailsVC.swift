//
//  FG_ProductCatalogueDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 24/01/2023.
//

import UIKit
import Kingfisher
import LanguageManager_iOS


class FG_ProductCatalogueDetailsVC: BaseViewController, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    

    @IBOutlet weak var addmorePartnoBtn: UIButton!
    @IBOutlet weak var orderNowBtn: UIButton!
    @IBOutlet weak var dapTitle: UILabel!
    @IBOutlet weak var mrpTitle: UILabel!
    @IBOutlet weak var shortDescriptionTitle: UILabel!
    @IBOutlet weak var partNoTitlelbl: UILabel!
    @IBOutlet weak var headerLbl: UILabel!
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
        super.viewWillAppear(animated)
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.myCartApi()
            //  self.productListApi()
            localizatiuon()
            if productImageURL.count != 0{
                let totalImgURL = product_Image_Url + productImageURL
                productImage.kf.setImage(with: URL(string: "\(totalImgURL)"),placeholder: UIImage(named: "Image 3"))
            }

            self.qtyTF.isEnabled = false
        }
        
    }
    
    private func localizatiuon(){
        headerLbl.text = "Product_Catalogue_Details".localiz()
        shortDescriptionTitle.text = "\("Short Description".localiz()) :"
        orderNowBtn.setTitle("Order_Now".localiz(), for: .normal)
        addmorePartnoBtn.setTitle("Add more part no".localiz(), for: .normal)
        addToCartBtn.setTitle("addToCart".localiz(), for: .normal)
        addToDreamGfit.setTitle("".localiz(), for: .normal)
        partNoTitlelbl.text = "Part No".localiz()
        dapTitle.text = "DAP".localiz()
        mrpTitle.text = "MRP".localiz()
    }

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func addToCartButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            if self.addToCartView.isHidden == false{
                print(Int(self.totalPoints))
                print((self.mrp))
                // if Int(self.mrp ) ?? 0 <= Int(self.totalPoints ) ?? 0{
                self.productQuantityView.isHidden = false
                self.addToCartView.isHidden = true
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
                //  }else{
                //                self.addToCartView.isHidden = false
                //                self.productQuantityView.isHidden = true
                //                self.view.makeToast("Insufficient point balance", duration: 3.0, position: .bottom)
                //            }
            }
        }
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
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
       
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
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
       
    }
    
    @IBAction func quantityFieldEditingDidEnd(_ sender: Any) {
    }
    
    
    
    @IBAction func addToDreamGiftBtn(_ sender: Any) {
    }
    
    
    @IBAction func orderNowButton(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueMyCartVC") as! FG_ProductCatalogueMyCartVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func addMorePartNoButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func myCartBtn(_ sender: Any) {
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueMyCartVC") as! FG_ProductCatalogueMyCartVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
