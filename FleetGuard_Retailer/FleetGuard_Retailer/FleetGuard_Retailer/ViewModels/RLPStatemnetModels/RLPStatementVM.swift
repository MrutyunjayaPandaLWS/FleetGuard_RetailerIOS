//
//  RLPStatementVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 24/02/23.
//

import UIKit

class RLPStatementVM {
    
        weak var VC: RPLStatementVC?
        var requestAPIs = RestAPI_Requests()
        var rlpStatemnetArray = [LstRetailerBonding1]()
    var pointBalence = [ObjCustomerDashboardList11]()
    func rlpStatemnetData(parameters: JSON) -> (){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.rlpStatementAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.rlpStatemnetArray = result?.lstRetailerBonding ?? []
                        print(self.rlpStatemnetArray.count,"dlskjdkj")
                        var mileStone = UserDefaults.standard.integer(forKey: "TotalMileStonePoints")
                        if self.rlpStatemnetArray.count != 0 {
                            self.VC?.shopNameValue.text = result?.lstRetailerBonding?[0].companyName ?? ""
//                            self.VC?.balancePts.text = "\(result?.sumOfTotalPoint ?? "")"
                            self.VC?.pointBalance = "\(mileStone)" // result?.sumOfMilstonPoints ?? ""
                            let milstonepts = Int(Double(result?.sumOfMilstonPoints ?? "0") ?? 0)
                            self.VC?.milestonePts.text = "\(mileStone)"// "\(milstonepts )"
                        }else{
                                self.VC?.view.makeToast("Datas not available !", duration: 2.0, position: .bottom)
                        }
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
    
    
    
    func pointBalenceAPI(parameter: JSON){
        DispatchQueue.main.async {
//            self.VC?.startLoading()
        }
        self.requestAPIs.pointBalenceAPI(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                DispatchQueue.main.async {
//                    self.VC?.stopLoading()
                    self.pointBalence = result?.objCustomerDashboardList ?? []
                    
                    if result?.objCustomerDashboardList?.count != 0 {
                        let pointBal = result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0
                        let pendingRedemptionBal = UserDefaults.standard.string(forKey: "totalPendingCount")
                        let calculateBal = pointBal - (Int(pendingRedemptionBal ?? "0") ?? 0)
                        self.VC?.balancePts.text = "\(calculateBal)"// "\(Int(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0))"
//                        UserDefaults.standard.set(result?.objCustomerDashboardList?[0].totalEarnedPoints, forKey: "totalEarnedPoints")
//                        UserDefaults.standard.set(result?.objCustomerDashboardList?[0].redeemablePointsBalance, forKey: "redeemablePointsBalance")
                        UserDefaults.standard.set(true, forKey: "AfterLog")
                        UserDefaults.standard.synchronize()
                    }
                   
                }
                }else{
                    DispatchQueue.main.async {
//                    self.VC?.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
//                self.VC?.stopLoading()
                }
            }
        }
        
    }
    
}
