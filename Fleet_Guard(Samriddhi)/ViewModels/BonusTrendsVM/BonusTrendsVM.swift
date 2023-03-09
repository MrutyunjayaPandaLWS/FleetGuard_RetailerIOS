//
//  BonusTrendsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 07/03/23.
//

import UIKit

class BonusTrendsVM {
        
            weak var VC: FG_BonusTrendGraphVC?
            var requestAPIs = RestAPI_Requests()
            var myBonusTrendGraphArray = [LstRetailerBonding5]()
            var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
            var myBonusDataArray = [LstRetailerBonding5]()
            //var myPointsMonthData:[JSON] = []
           
            
                func bonusTrendsAPI(parameters: JSON, completion: @escaping (BonusTrandGraphModels?) -> ()) {
                    DispatchQueue.main.async {
                        self.VC?.startLoading()
                    }
                    self.requestAPIs.bonusTrendGraphAPI(parameters: parameters) { (result, error) in
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


                                        
