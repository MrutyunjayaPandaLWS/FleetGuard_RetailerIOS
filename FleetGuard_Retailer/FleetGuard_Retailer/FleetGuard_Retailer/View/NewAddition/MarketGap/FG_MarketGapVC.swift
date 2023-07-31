//
//  FG_MarketGapVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_MarketGapVC: BaseViewController, MarketingGapDelegate {
    func marketGapForward(_ cell: FG_MarketGapTVC) {
        guard let tappedIndexPath = self.markrtingGapView.indexPath(for: cell) else{return}
        if cell.forwardButton.tag == tappedIndexPath.row{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
            vc.productImageURL = self.VM.myMarketGapArray[tappedIndexPath.row].productImg ?? ""
            vc.productName = self.VM.myMarketGapArray[tappedIndexPath.row].productName ?? ""
            vc.partNo = self.VM.myMarketGapArray[tappedIndexPath.row].productCode ?? ""
            vc.shortDesc = self.VM.myMarketGapArray[tappedIndexPath.row].productShortDesc ?? ""
            vc.dap = "\(self.VM.myMarketGapArray[tappedIndexPath.row].salePrice ?? 0)"
            let splitData = "\(self.VM.myMarketGapArray[tappedIndexPath.row].mrp ?? "")".split(separator: ".")
            vc.mrp = "\(splitData[0])"
            vc.productId = "\(self.VM.myMarketGapArray[tappedIndexPath.row].productId ?? 0)"
            vc.productDesc = "\(self.VM.myMarketGapArray[tappedIndexPath.row].productDesc ?? "")"
//            vc.cateogryId = "\(self.VM.productListArray[tappedIndexPath.row].category ?? 0)"
         
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
    @IBOutlet var markrtingGapView: UITableView!
    @IBOutlet var noDataFoundLbl: UILabel!
    

    var VM = MarketGapVM()
    
    var noofelements = 0
    var startindex = 0
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        noDataFoundLbl.isHidden = true
        self.markrtingGapView.delegate = self
        self.markrtingGapView.dataSource = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.noDataFoundLbl.text = "noDataFound".localiz()
        if MyCommonFunctionalUtilities.isInternetCallTheApi() == false{
            DispatchQueue.main.async{
                let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IOS_FG_Internet_Check") as! IOS_FG_Internet_Check
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }else{
            noDataFoundLbl.isHidden = true
            self.VM.myMarketGapArray.removeAll()
            counterGap(startIndex: startindex)
        }
    }
    
    private func localization(){
    
    }
    
    func counterGap(startIndex: Int){
        let parameters = [
            "ActionType": "16",
            "ActorId": "\(userId)",
            "SearchText": "",
            "LoyaltyID": "\(loyaltyId)",
            "StartIndex": startIndex,
            "PageSize":"20",
            "ProductDetails": [
                "BrandId": 0,
                "Cat1": 0,
                "Cat2": 0,
                 "Cat3": 0,
                "Cat4": 0,
                "NlStatus": "NEW",
                "SkuMaxPrice": 0,
                "SkuMinPrice": 0
                ]
        ] as [String: Any]
        print(parameters)
        self.VM.marketGapDataAPI(parameters: parameters)
        
    }
}

extension FG_MarketGapVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myMarketGapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MarketGapTVC") as! FG_MarketGapTVC
        
        cell.delegate = self
        cell.dapAmount.text = "\(VM.myMarketGapArray[indexPath.row].salePrice ?? 0)"
        cell.mrpAmountLbl.text = VM.myMarketGapArray[indexPath.row].mrp ?? "-"
        cell.productNameLbl.text = VM.myMarketGapArray[indexPath.row].productName ?? "-"
        cell.partNoLbl.text = "\("Part No".localiz()): \(VM.myMarketGapArray[indexPath.row].partyLoyaltyId ?? "-")"
        
        let imageData = VM.myMarketGapArray[indexPath.row].productImg ?? ""
        //let imageImage = (self.VM.offersandPromotionsArray[indexPath.row].proImage ?? "").dropFirst(3)
        if imageData.count > 0{
            let totalImgURL = product_Image_Url + imageData
            cell.productImage.kf.setImage(with: URL(string: totalImgURL), placeholder: UIImage(named: "image_2022_12_20T13_15_20_335Z"))
        }
        cell.forwardButton.tag = indexPath.row
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
