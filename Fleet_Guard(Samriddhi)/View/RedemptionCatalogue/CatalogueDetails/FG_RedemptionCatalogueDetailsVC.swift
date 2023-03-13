//
//  FG_CatalogueDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 23/01/2023.
//

import UIKit

class FG_RedemptionCatalogueDetailsVC: BaseViewController, popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {
        
    }
    
    
    @IBOutlet weak var addedToDreamGiftLbl: UILabel!
    @IBOutlet weak var addToDreamGiftLbl: UILabel!
    @IBOutlet weak var addedToCartLbl: UILabel!
    @IBOutlet weak var addToCartLbl: UILabel!
    @IBOutlet weak var addedToDreamGiftView: UIView!
    @IBOutlet weak var addToDreamGiftView: UIView!
    @IBOutlet weak var addedToCartView: UIView!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var productPoints: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var productImage: UIView!
    
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var headerText: UILabel!
    
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var termsAndConLbl: UILabel!
    
    @IBOutlet var productImag: UIImageView!
    @IBOutlet weak var addToCartBtn: UILabel!
    
    var productImages = ""
    var prodRefNo = ""
    var productCategory = ""
    var productName = ""
    var productPoint = ""
    var tdspercentage1 = 0.0
    var applicabletds = 0.0
    var productDetails = ""
    var termsandContions = ""
    var quantity = 0
    var categoryId = 0
    var catalogueId = 0
    var isComeFrom = ""
    var requestApis = RestAPI_Requests()
    var pointBalance = UserDefaults.standard.string(forKey: "totalEarnedPoints") ?? ""
   // var pointBalance = UserDefaults.standard.string(forKey: "RedeemablePointBalance") ?? ""
    let verifiedStatus = UserDefaults.standard.integer(forKey: "verificationStatus")
    var userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var VM = RedemptionCatalogeDetailsVM()
    
    //let verifiedStatus = UserDefaults.standard.integer(forKey: "VerifiedStatus")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productImage.clipsToBounds = false
        print(catalogueId,"skjhdk")
        //  self.productImage.layer.borderWidth = 1
        
        self.productImage.layer.cornerRadius = 36
        self.productImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        productImage.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        productImage.layer.shadowOpacity = 0.4
        productImage.layer.shadowRadius = 0.4
        productImage.layer.shadowColor = UIColor.darkGray.cgColor
        //self.categoryLbl.text = productCategory
        self.productNameLbl.text = productName
        self.productPoints.text = "Points: \(productPoint)"
        self.descriptionLbl.text = productDetails
        self.termsAndConLbl.text = termsandContions
        let receivedImage = "\(String(describing: productImage))"
        print(receivedImage)
        self.productImag.kf.setImage(with: URL(string: "\(PROMO_IMG1)\(receivedImage)"), placeholder: UIImage(named: "image_2022_12_20T13_15_20_335Z"));
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myCartListApi()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func cartBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyCartVC") as! FG_MyCartVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func addToDreamGiftBtn(_ sender: Any) {
    }
    
    @IBAction func addToCartBTN(_ sender: Any) {

        if self.verifiedStatus != 1{
//            DispatchQueue.main.async{
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                vc!.delegate = self
//                vc!.titleInfo = ""
//                vc!.descriptionInfo = "You are not allowled to redeem .Please contact your administrator"
//                vc!.modalPresentationStyle = .overCurrentContext
//                vc!.modalTransitionStyle = .crossDissolve
//                self.present(vc!, animated: true, completion: nil)
//            }
            self.view.makeToast("You are not allowled to redeem. Please contact your administrator", duration: 3.0, position: .bottom)
               
            
        }else{
            
            print(productPoint,"skjds")
            print(pointBalance,"slkjds")
            
            if Int(productPoint) ?? 0 <= Int(pointBalance) ?? 0 {
                self.addToCartApi()
                self.myCartListApi()
                
            }else{
//                DispatchQueue.main.async{
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                    vc!.delegate = self
//                    vc!.titleInfo = ""
//                    vc!.descriptionInfo = "Insufficent Point Balance"
//                    vc!.modalPresentationStyle = .overCurrentContext
//                    vc!.modalTransitionStyle = .crossDissolve
//                    self.present(vc!, animated: true, completion: nil)
//                }
                self.view.makeToast("Insufficent Point Balance", duration: 3.0, position: .bottom)
            }
        }  
    }
    
    
    func addToCartApi(){
        
        let parameter = [
            "ActionType": "1",
            "ActorId": "\(self.userID)",
            "CatalogueSaveCartDetailListRequest": [
                [
                    "CatalogueId": "\(catalogueId)",
                    "DeliveryType": "1",
                    "NoOfQuantity": "1"
                ]
            ],
            "LoyaltyID": "\(loyaltyId)",
            "MerchantId": "1"
        ] as [String: Any]
        print(parameter)
        self.VM.redemptionCatalogueAddToCartApi(parameter: parameter)
    }
    
    
    func myCartListApi(){
        let parameter = [
            "ActionType": "2",
            "LoyaltyID": "\(self.loyaltyId)"
        ] as [String: Any]
       // self.VM.redemptionCatalogueMyCartListApi(parameter: parameter)
        self.requestApis.redemptionCatalogueMycartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.stopLoading()
                        self.VM.redemptionCatalogueMyCartListArray = result?.catalogueSaveCartDetailListResponse ?? []
                        
                        if self.VM.redemptionCatalogueMyCartListArray.count != 0 {
                            self.countLbl.isHidden = false
                            self.countLbl.text = "\(self.VM.redemptionCatalogueMyCartListArray.count)"
                        }else{
                            self.countLbl.isHidden = true
                            
                        }
                        let filterArray = self.VM.redemptionCatalogueMyCartListArray.filter{$0.catalogueId == self.catalogueId}
                        
                        print(filterArray.count,"skhask")
                        
                        if filterArray.count > 0 {
                            self.addedToCartView.isHidden = false
                            self.addToCartView.isHidden = true
                        }else{

                            self.addedToCartView.isHidden = true
                            self.addToCartView.isHidden = false
                        }
                        
                        
                       
                    }

                }else{
                    DispatchQueue.main.async {
                        self.stopLoading()
                        print("\(error)")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.stopLoading()
                    print("\(error)")
                }
            }
        }
    }
        

    
    
    
}
