//
//  MarketGapVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 09/03/23.
//

import UIKit

class MarketGapVM: UIViewController {

    weak var VC: FG_MarketGapVC?
    var requestAPIs = RestAPI_Requests()
    var myMarketGapArray = [LsrProductDetails12]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var myMarketGapArray1 = [LsrProductDetails12]()
    
    
    func marketGapDataAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
        self.requestAPIs.marketGapAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.myMarketGapArray1 = result?.lsrProductDetails ?? []
                        self.VC?.noofelements = self.myMarketGapArray1.count
                        self.myMarketGapArray = self.myMarketGapArray + self.myMarketGapArray1
                        
                        print(self.myMarketGapArray.count, "myBillingsListingArrayCount")
                        if self.myMarketGapArray.count != 0{
                            self.VC?.markrtingGapView.isHidden = false
                            self.VC?.noDataFoundLbl.isHidden = true
                            self.VC?.markrtingGapView.reloadData()
                            
                        }else{
                            self.VC?.markrtingGapView.isHidden = true
                            self.VC?.noDataFoundLbl.isHidden = false
                        }
                        self.VC?.stopLoading()
                    }

                }else{
                    DispatchQueue.main.async {
                        self.VC?.noDataFoundLbl.isHidden = false
                        self.VC?.stopLoading()
                        print("\(error)")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.VC?.noDataFoundLbl.isHidden = false
                    self.VC?.stopLoading()
                    print("\(error)")
                }
            }
        }
    }

}
