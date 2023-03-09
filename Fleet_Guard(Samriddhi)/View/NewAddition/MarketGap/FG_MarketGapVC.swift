//
//  FG_MarketGapVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_MarketGapVC: BaseViewController, MarketingGapDelegate {
    func marketGapForward(_ cell: FG_MarketGapTVC) {
        guard let tappedIndexPath = self.markrtingGapView.indexPath(for: cell) else{return}
        let vc = UIStoryboard(name:"Main" , bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
        vc.productName = VM.myMarketGapArray[tappedIndexPath.row].productName ?? "-"
        vc.partNo = VM.myMarketGapArray[tappedIndexPath.row].partyLoyaltyId ?? "-"
        vc.productDesc = VM.myMarketGapArray[tappedIndexPath.row].productDesc ?? "-"
        vc.dap = "\(VM.myMarketGapArray[tappedIndexPath.row].points ?? 0)"
        vc.mrp = VM.myMarketGapArray[tappedIndexPath.row].mrp ?? "-"
        self.navigationController?.popViewController(animated: true)
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
        self.markrtingGapView.delegate = self
        self.markrtingGapView.dataSource = self
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
        cell.dapAmount.text = "\(VM.myMarketGapArray[indexPath.row].points ?? 0)"
        cell.mrpAmountLbl.text = VM.myMarketGapArray[indexPath.row].mrp ?? "-"
        cell.productNameLbl.text = VM.myMarketGapArray[indexPath.row].productName ?? "-"
        cell.partNoLbl.text = "Part no: \(VM.myMarketGapArray[indexPath.row].partyLoyaltyId ?? "-")"
        
        let imageData = VM.myMarketGapArray[indexPath.row].brandImg ?? ""
        //let imageImage = (self.VM.offersandPromotionsArray[indexPath.row].proImage ?? "").dropFirst(3)
        let totalImgURL = PROMO_IMG1 + imageData
        cell.productImage.kf.setImage(with: URL(string: totalImgURL), placeholder: UIImage(named: "image_2022_12_20T13_15_20_335Z"))
        
        return cell
    }
}
