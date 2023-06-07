//
//  FG_CounterGapVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import LanguageManager_iOS

class FG_CounterGapVC: BaseViewController, CounterGapDelegate {
    func counterGapForward(_ cell: FG_CounterGapTVC) {        
        guard let tappedIndexPath = self.CounterGapTableView.indexPath(for: cell) else{return}
        if cell.forwardButton.tag == tappedIndexPath.row{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
            vc.productImageURL = self.VM.myCounterGapArray[tappedIndexPath.row].productImg ?? ""
            vc.productName = self.VM.myCounterGapArray[tappedIndexPath.row].productName ?? ""
            vc.partNo = self.VM.myCounterGapArray[tappedIndexPath.row].productCode ?? ""
            vc.shortDesc = self.VM.myCounterGapArray[tappedIndexPath.row].productShortDesc ?? ""
            vc.dap = "\(self.VM.myCounterGapArray[tappedIndexPath.row].salePrice ?? 0)"
            let splitData = "\(self.VM.myCounterGapArray[tappedIndexPath.row].mrp ?? "")".split(separator: ".")
            vc.mrp = "\(splitData[0])"
            vc.productId = "\(self.VM.myCounterGapArray[tappedIndexPath.row].productId ?? 0)"
            vc.productDesc = "\(self.VM.myCounterGapArray[tappedIndexPath.row].productDesc ?? "")"
//            vc.cateogryId = "\(self.VM.myCounterGapArray[tappedIndexPath.row].category ?? 0)"
         
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
    @IBOutlet weak var CounterGapTableView: UITableView!
    
    @IBOutlet var noDataFound: UILabel!
    var VM = CounterGapVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var noofelements = 0
    var startindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.noDataFound.text = "noDataFound".localiz()
        CounterGapTableView.delegate = self
        CounterGapTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noDataFound.isHidden = true
        self.VM.myCounterGapArray.removeAll()
        counterGap(startIndex: startindex)
    }
    
    func counterGap(startIndex: Int){
        let parameters = [
            "ActionType": "15",
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
        self.VM.counterGapDataAPI(parameters: parameters)
        }
}
extension FG_CounterGapVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.myCounterGapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_CounterGapTVC", for: indexPath) as! FG_CounterGapTVC
        
        cell.delegate = self
        cell.dapAmount.text = "\(VM.myCounterGapArray[indexPath.row].salePrice ?? 0)"
        cell.mrpAmountLbl.text = VM.myCounterGapArray[indexPath.row].mrp ?? "-"
        cell.productNameLbl.text = VM.myCounterGapArray[indexPath.row].productName ?? "-"
        cell.partNoLbl.text = "Part no: \(VM.myCounterGapArray[indexPath.row].partyLoyaltyId ?? "-")"
        
        let imageData = VM.myCounterGapArray[indexPath.row].brandImg ?? ""
        //let imageImage = (self.VM.offersandPromotionsArray[indexPath.row].proImage ?? "").dropFirst(3)
        let totalImgURL = PROMO_IMG1 + imageData
        cell.productImage.kf.setImage(with: URL(string: totalImgURL), placeholder: UIImage(named: "image_2022_12_20T13_15_20_335Z"))
        cell.forwardButton.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == VM.myCounterGapArray.count - 2{
                    if noofelements == 20{
                        self.startindex = startindex + 1
                        self.counterGap(startIndex: startindex)
                    }else if noofelements < 20{
                        return
                    }else{
                        print("n0 more elements")
                        return
                    }
                }
            }

    }
    
}
