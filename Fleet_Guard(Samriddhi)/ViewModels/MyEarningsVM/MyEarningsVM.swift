//
//  MyEarningsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 17/02/23.
//

import UIKit

class MyEarningsVM {

    weak var VC: FG_MyEarningVC?
    var requestAPIs = RestAPI_Requests()
    var myEarningsArray = [ObjCustomerDashboardList2]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    
    func myEarningsAPI(paramters: JSON){
        self.requestAPIs.myEarningAPI(parameters: paramters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myEarningsArray = result?.objCustomerDashboardList ?? []
                        print(self.myEarningsArray.count)
                        if self.myEarningsArray.count != 0 {
                            self.VC?.emptyMessageLbl.isHidden = true
                            self.VC?.myEarningTableView.isHidden = false
                            self.VC?.myEarningTableView.reloadData()
                            
                        }else{
                            self.VC?.myEarningTableView.isHidden = true
                            self.VC?.emptyMessageLbl.isHidden = false
                            
                        }
                    }
                } else {
                    print("No Response")
                    DispatchQueue.main.async {
                        self.VC?.emptyMessageLbl.isHidden = false
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_Login \(error)")
                DispatchQueue.main.async {
                    self.VC?.emptyMessageLbl.isHidden = false
                    self.VC?.stopLoading()
                }

        }
    }
    
    }
}
