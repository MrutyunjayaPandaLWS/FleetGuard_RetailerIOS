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
                        if self.rlpStatemnetArray.count != 0 {
                            self.VC?.shopNameValue.text = result?.lstRetailerBonding?[0].companyName ?? ""
                            self.VC?.balancePts.text = "\(result?.sumOfTotalPoint ?? "")"
                            self.VC?.milestonePts.text = "\(result?.sumOfMilstonPoints ?? "")"
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
}
