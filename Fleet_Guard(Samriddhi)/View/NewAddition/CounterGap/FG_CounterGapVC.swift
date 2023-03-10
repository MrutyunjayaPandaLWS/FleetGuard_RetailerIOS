//
//  FG_CounterGapVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit

class FG_CounterGapVC: BaseViewController, CounterGapDelegate {
    func counterGapForward(_ cell: FG_CounterGapTVC) {
        guard let tappedIndexPath = self.CounterGapTableView.indexPath(for: cell) else{return}
        let vc = UIStoryboard(name:"Main" , bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCatalogueDetailsVC") as! FG_ProductCatalogueDetailsVC
        vc.productName = VM.myCounterGapArray[tappedIndexPath.row].productName ?? "-"
        vc.partNo = VM.myCounterGapArray[tappedIndexPath.row].partyLoyaltyId ?? "-"
        vc.productDesc = VM.myCounterGapArray[tappedIndexPath.row].productDesc ?? "-"
        vc.dap = "\(VM.myCounterGapArray[tappedIndexPath.row].points ?? 0)"
        vc.mrp = VM.myCounterGapArray[tappedIndexPath.row].mrp ?? "-"
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var CounterGapTableView: UITableView!
    
    var VM = CounterGapVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    var noofelements = 0
    var startindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        CounterGapTableView.delegate = self
        CounterGapTableView.dataSource = self
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
        cell.dapAmount.text = "\(VM.myCounterGapArray[indexPath.row].points ?? 0)"
        cell.mrpAmountLbl.text = VM.myCounterGapArray[indexPath.row].mrp ?? "-"
        cell.productNameLbl.text = VM.myCounterGapArray[indexPath.row].productName ?? "-"
        cell.partNoLbl.text = "Part no: \(VM.myCounterGapArray[indexPath.row].partyLoyaltyId ?? "-")"
        
        let imageData = VM.myCounterGapArray[indexPath.row].brandImg ?? ""
        //let imageImage = (self.VM.offersandPromotionsArray[indexPath.row].proImage ?? "").dropFirst(3)
        let totalImgURL = PROMO_IMG1 + imageData
        cell.productImage.kf.setImage(with: URL(string: totalImgURL), placeholder: UIImage(named: "image_2022_12_20T13_15_20_335Z"))
        
        
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
