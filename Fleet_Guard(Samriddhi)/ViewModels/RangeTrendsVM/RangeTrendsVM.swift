//
//  RangeTrendsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 07/03/23.
//

import UIKit

class RangeTrendsVM {
    
    weak var VC: FG_RangeTrendGraphVC?
    var requestAPIs = RestAPI_Requests()
    var myRangeTrendGraphArray = [LstRetailerBonding4]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var myRangeDataArray = [LstRetailerBonding4]()
    //var myPointsMonthData:[JSON] = []
    
    
    func rangeTrendsAPI(parameters: JSON, completion: @escaping (RangeTrendsGraphModels?) -> ()) {
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.rangeTrendGraphAPI(parameters: parameters) { (result, error) in
            if error == nil {
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        self.VC?.stopLoading()
                    }
                } else {
                    print("No Response")
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_Login \(error)")
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                }
                
            }
            
        }
    }
    
}
