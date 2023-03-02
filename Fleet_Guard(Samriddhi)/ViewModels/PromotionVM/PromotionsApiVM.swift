//
//  PromotionsApiVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 17/02/23.
//

import UIKit

class PromotionsApiVM{

    weak var VC: FG_MyPromotionsVC?
    var requestAPIs = RestAPI_Requests()
    var promomotionListingArray = [LstPromotionJsonList1]()
    
    func promotionsListingAP(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
            self.requestAPIs.promotionsListingAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.promomotionListingArray = result?.lstPromotionJsonList ?? []
                        print(self.promomotionListingArray.count, "Offers Count")
                        if self.promomotionListingArray.count != 0 {
                            self.VC?.myPromotionsTableView.isHidden = false
                            self.VC?.myPromotionsTableView.reloadData()
                            self.VC?.noDataFound.isHidden = true
                            }else{
                                self.VC?.myPromotionsTableView.isHidden = true
                                self.VC?.noDataFound.isHidden = false
                            }
                        
                    }

                }else{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        print("\(error)")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                    print("\(error)")
                }
            }
        }
    }
}
