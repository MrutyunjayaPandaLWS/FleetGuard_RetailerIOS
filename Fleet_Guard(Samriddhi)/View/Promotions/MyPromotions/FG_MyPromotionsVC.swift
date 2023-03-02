//
//  FG_MyPromotionsVC.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 19/01/2023.
//

import UIKit
import Kingfisher
class FG_MyPromotionsVC: BaseViewController,SendOffersDetailsDelegate{
    func sendOffersDetails(_ cell: FG_MyPromotionsTVC) {
        guard let tappedIndexPath = myPromotionsTableView.indexPath(for: cell) else {return}
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_MyPromotionDetailsVC") as! FG_MyPromotionDetailsVC
        vc.promotionId = VM.promomotionListingArray[tappedIndexPath.row].promotionId ?? 0
        vc.selectedTitle = self.VM.promomotionListingArray[tappedIndexPath.row].promotionName ?? ""
        vc.selectedOfferId = "\(self.VM.promomotionListingArray[tappedIndexPath.row].promotionId ?? 0)"
        vc.selectedLongDesc = self.VM.promomotionListingArray[tappedIndexPath.row].proLongDesc ?? ""
        vc.selectedShortDesc = self.VM.promomotionListingArray[tappedIndexPath.row].proShortDesc ?? ""
        vc.selectedImage = self.VM.promomotionListingArray[tappedIndexPath.row].proImage ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBOutlet weak var myPromotionsTableView: UITableView!
    @IBOutlet weak var noDataFound: UILabel!
    
    
    var VM = PromotionsApiVM()
    var userId = UserDefaults.standard.string(forKey: "UserID") ?? ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.VM.VC = self
        self.myPromotionsTableView.delegate = self
        self.myPromotionsTableView.dataSource = self
        promotionListingAPI()
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func promotionListingAPI(){
        let parameters = [
            "ActionType": "99",
            "ActorId": "\(userId)"
        ] as [String: Any]
        print(parameters)
        self.VM.promotionsListingAP(parameters: parameters)
    }
     
}
extension FG_MyPromotionsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.promomotionListingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "FG_MyPromotionsTVC", for: indexPath) as! FG_MyPromotionsTVC
        cell.selectionStyle = .none
        cell.delegate = self
        cell.promotionTitleLbl.text = VM.promomotionListingArray[indexPath.row].promotionName ?? ""
        cell.priceValueLbl.text = "\(VM.promomotionListingArray[indexPath.row].pointBalance ?? 0)"
        
        
        let imageURL = VM.promomotionListingArray[indexPath.row].proImage ?? ""
        print(imageURL)
        if imageURL != ""{
            let filteredURLArray = imageURL.dropFirst(2)
            let urltoUse = String(PROMO_IMG1 + filteredURLArray).replacingOccurrences(of: " ", with: "%20")
            let urlt = URL(string: "\(urltoUse)")
            print(urlt)
            cell.promotionImage.kf.setImage(with: URL(string: "\(String(describing: urlt))"), placeholder: UIImage(named: "Asset 2"));
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
