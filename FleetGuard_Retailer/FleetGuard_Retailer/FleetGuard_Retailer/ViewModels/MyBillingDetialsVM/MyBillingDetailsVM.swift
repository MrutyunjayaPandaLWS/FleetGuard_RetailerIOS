//
//  MyBillingDetailsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 06/03/23.
//

import UIKit

class MyBillingDetailsVM {

    weak var VC: FG_MyBillingDetailsVC?
    var requestAPIs = RestAPI_Requests()
    var myBillingsDetailArray = [LstTransactionApprovalDetails1]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
   
    func billingsDetailsAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
            self.requestAPIs.BillingDetailsImpAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myBillingsDetailArray = result?.lstTransactionApprovalDetails ?? []
                        print(self.myBillingsDetailArray.count, "myBillingsListingArrayCount")
                        if self.myBillingsDetailArray.count != 0{
                            self.VC?.orderDetailsTV.isHidden = false
                            self.VC?.orderDetailsTV.reloadData()
                            self.VC?.noDataFoundLbl.isHidden = true
                            
                        }else{
                            self.VC?.orderDetailsTV.isHidden = true
                            self.VC?.noDataFoundLbl.isHidden = false
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
