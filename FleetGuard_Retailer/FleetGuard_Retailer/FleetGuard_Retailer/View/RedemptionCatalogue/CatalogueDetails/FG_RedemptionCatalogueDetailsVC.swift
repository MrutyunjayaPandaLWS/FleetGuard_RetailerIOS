//
//  FG_CatalogueDetailsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 23/01/2023.
//

import UIKit
import LanguageManager_iOS

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
    
    
    
    @IBOutlet weak var descriptionHeadingLbl: UILabel!
    @IBOutlet weak var termsAndCponditionHeadingLbl: UILabel!
    
    @IBOutlet weak var addToCartActionBTN: UIButton!
    
    
    
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
        languageLoc()
        self.productImage.layer.cornerRadius = 36
        self.productImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        productImage.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        productImage.layer.shadowOpacity = 0.4
        productImage.layer.shadowRadius = 0.4
        productImage.layer.shadowColor = UIColor.darkGray.cgColor
        self.categoryLbl.text = "\("Category".localiz()) / \(self.productCategory)"
        self.productNameLbl.text = productName
        self.productPoints.text = "\("PointsData".localiz()) \(productPoint)"
        self.descriptionLbl.text = productDetails
        self.termsAndConLbl.text = termsandContions
        let receivedImage = "\(String(describing: productImages))"
        print(receivedImage)
        self.productImag.kf.setImage(with: URL(string: "\(receivedImage)"), placeholder: UIImage(named: "image_2022_12_20T13_15_20_335Z"));
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
            headerText.text = "Redemption_Catalogue".localiz()
            myCartListApi()
        }
    }
    
    
    func languageLoc(){
        self.descriptionHeadingLbl.text = "Descriptions".localiz()
        self.termsAndCponditionHeadingLbl.text = "Terms and conditions".localiz()
        self.addToCartLbl.text = "addToCart".localiz()
        self.addedToCartLbl.text = "addedToCart".localiz()
        
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
        
        self.addToCartActionBTN.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if self.verifiedStatus != 1{
                self.view.makeToast("redeem_failed_contact_to_admin".localiz(), duration: 3.0, position: .bottom)
            }else{
                print(self.productPoint,"skjds")
                print(self.pointBalance,"slkjds")
                
                if Int(self.productPoint) ?? 0 <= Int(self.pointBalance) ?? 0 {
                    let filterArray = self.VM.redemptionCatalogueMyCartListArray.filter{$0.catalogueId == self.catalogueId}
                    if filterArray.count > 0 {
                        self.view.makeToast("Product is Already there in my cart".localiz(), duration: 3.0, position: .bottom)
                    }else{
                    self.addToCartApi()
                    }
                    
                }else{
                    self.view.makeToast("Insufficent_Point_Balance".localiz(), duration: 3.0, position: .bottom)
                }
               
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
        print(parameter,"dkjfkf")
        self.requestApis.redemptionCatalogueMycartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.stopLoading()
                        self.addToCartActionBTN.isEnabled = true
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
