//
//  FG_FocusGroupVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by admin on 05/06/23.
//

import UIKit
import LanguageManager_iOS

class FG_FocusGroupVC: BaseViewController, UITableViewDelegate, UITableViewDataSource,FocusGroupTVCDelegate {
   
    
    func sendDataToDetails(_ cell: FG_FocusGroupTVC) {
        guard let tappedIndexPath = self.focusGroupListTV.indexPath(for: cell) else{return}
        if cell.nextButton.tag == tappedIndexPath.row{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
            vc.productImageURL =  cell.imageUrl
            vc.productName = self.VM.productListArray[tappedIndexPath.row].productName ?? ""
            vc.partNo = self.VM.productListArray[tappedIndexPath.row].productCode ?? ""
            vc.shortDesc = self.VM.productListArray[tappedIndexPath.row].productShortDesc ?? ""
            vc.dap = "\(self.VM.productListArray[tappedIndexPath.row].salePrice ?? 0)"
            let splitData = "\(self.VM.productListArray[tappedIndexPath.row].mrp ?? "")".split(separator: ".")
            vc.mrp = "\(splitData[0])"
            vc.productId = "\(self.VM.productListArray[tappedIndexPath.row].productId ?? 0)"
            vc.productDesc = "\(self.VM.productListArray[tappedIndexPath.row].productDesc ?? "")"
//            vc.cateogryId = "\(self.VM.productListArray[tappedIndexPath.row].category ?? 0)"
         
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    func didTappedImageViewBtn(cell: FG_FocusGroupTVC) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductImageDetailsVC") as? FG_ProductImageDetailsVC
        vc?.imageUrl = cell.imageUrl
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBOutlet weak var focusGroupListTV: UITableView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var myCartBadgesLbl: UILabel!
    @IBOutlet weak var nodatafoundLbl: UILabel!
    
    var VM = FG_FocusGroupVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var noofelements = 0
    var startindex = 0
    
    var categoryId = 0
    var categoryId1 = 0
    var categoryId2 = 0
    var categoryId3 = 0
    var albumID = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        focusGroupListTV.delegate = self
        focusGroupListTV.dataSource = self
        myCartBadgesLbl.isHidden =  true
        nodatafoundLbl.isHidden = true
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.nodatafoundLbl.text = "noDataFound".localiz()
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            self.VM.productListArray.removeAll()
            self.productListApi(startIndex: startindex, searchText:  "")
            self.myCartApi()
        }
    }

    @IBAction func didTappedBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func difTappedlanguageBtn(_ sender: UIButton) {
    }
    
    @IBAction func didTappedMycartBtn(_ sender: UIButton) {
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
    
    
    
    
    func productListApi(startIndex: Int, searchText: String){
        let parameter = [
            "ActionType": "17",
            "ActorId": "\(self.userId)",
            "LoyaltyID": "\(self.loyaltyId)",
            "ProductDetails": [
                "BrandId": 0,
                "Cat1": 0,
                "Cat2": 0,
                "Cat3": 0,
                "Cat4": 0,
                "NlStatus": "NEW",
                "SkuMaxPrice": 0,
                "SkuMinPrice": 0,
                "Alubum_ID": self.albumID
            ],
            "SearchText": ""
    ] as [String: Any]
//        let parameter = [
//            "ActionType": "17",
//            "ActorId": "\(self.userId)",
//            "LoyaltyID": "\(self.loyaltyId)",
//            "StartIndex": startIndex,
//            "PageSize": 10,
//            "ProductDetails": [
//                "BrandId": 0,
//                "Cat1": 0,
//                "Cat2": 0,
//                "Cat3": 0,
//                "Cat4": 0,
//                "NlStatus": "NEW",
//                "SkuMaxPrice": 0,
//                "SkuMinPrice": 0,
//                "Alubum_ID": self.albumID
//            ],
//            "SearchText": ""
//    ] as [String: Any]
        print(parameter)
        self.VM.productListApi(parameter: parameter)
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
    


    
    
}

extension FG_FocusGroupVC{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return self.VM.productListArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_FocusGroupTVC", for: indexPath) as! FG_FocusGroupTVC
        cell.selectionStyle = .none
        cell.delegate = self
        cell.productNameLbl.text = self.VM.productListArray[indexPath.row].productName ?? ""
        cell.partNoLbl.text = self.VM.productListArray[indexPath.row].productCode ?? ""
        cell.dapLbl.text = "\(self.VM.productListArray[indexPath.row].salePrice ?? 0)"
        let splitData = "\(self.VM.productListArray[indexPath.row].mrp ?? "")".split(separator: ".")
        cell.mrpLbl.text = "\(splitData[0])"
        cell.productNameLbl.backgroundColor = .white
        let image = self.VM.productListArray[indexPath.row].productImg ?? ""
        if image.count == 0 || image == nil{
            cell.imageViewBtn.isEnabled = false
            cell.productImage.image = UIImage(named: "Image 3")
        }else{
            cell.imageViewBtn.isEnabled = true
            let imageUrl = "\(product_Image_Url)\(String(describing: image.replacingOccurrences(of: " ", with: "%20")))"
            cell.imageUrl = imageUrl
            cell.productImage.kf.setImage(with: URL(string: "\(imageUrl)"),placeholder: UIImage(named: "Image 3"))
        }
//        vc.dap = "\(self.VM.productListArray[tappedIndexPath.row].salePrice ?? 0)"
//        vc.mrp = "\(self.VM.productListArray[tappedIndexPath.row].mrp ?? "")"
        cell.nextButton.tag = indexPath.row
        
//        @IBOutlet weak var productImage: UIImageView!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//            if indexPath.row == VM.productListArray.count - 2{
//                if noofelements == 10{
//                    startindex = startindex + 1
//                    self.productListApi(startIndex: startindex, searchText:  "")
//                }else if noofelements > 10{
//                    startindex = startindex + 1
//                    self.productListApi(startIndex: startindex, searchText:  "")
//                }else if noofelements < 10{
//                    return
//                }else{
//                    print("n0 more elements")
//                    return
//                }
//            }
        }
    
}
