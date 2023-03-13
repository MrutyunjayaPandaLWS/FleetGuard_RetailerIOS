//
//  CounterGapVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 09/03/23.
//

import UIKit

class CounterGapVM {
    weak var VC: FG_CounterGapVC?
    var requestAPIs = RestAPI_Requests()
    var myCounterGapArray = [LsrProductDetails11]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var myCounterGapArray1 = [LsrProductDetails11]()
    
    func counterGapDataAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
        self.requestAPIs.counterGapAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myCounterGapArray1 = result?.lsrProductDetails ?? []
                        self.VC?.noofelements = self.myCounterGapArray1.count
                        self.myCounterGapArray = self.myCounterGapArray + self.myCounterGapArray1
                        
                        print(self.myCounterGapArray.count, "myBillingsListingArrayCount")
                        if self.myCounterGapArray.count != 0{
                            self.VC?.CounterGapTableView.isHidden = false
                            self.VC?.CounterGapTableView.reloadData()
                            self.VC?.noDataFound.isHidden = true
                        }else{
                            self.VC?.CounterGapTableView.isHidden = true
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
