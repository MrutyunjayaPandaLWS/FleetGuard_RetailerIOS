//
//  MyBillingVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 17/02/23.
//

import UIKit

class MyBillingVM {
    
    weak var VC: FG_MyBillingsVC?
    var requestAPIs = RestAPI_Requests()
    var myBillingsListingArray = [LstTransactionApprovalDetails]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
   
    func billingsListingAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
            self.requestAPIs.billingsListingAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myBillingsListingArray = result?.lstTransactionApprovalDetails ?? []
                        print(self.myBillingsListingArray.count, "myBillingsListingArrayCount")
                        if self.myBillingsListingArray.count != 0 {
                            self.VC?.myBillingsTableView.isHidden = false
                            self.VC?.myBillingsTableView.reloadData()
                            self.VC?.noDataFound.isHidden = true
                            self.VC?.billingHeaderStack.isHidden = false
                            
                        }else{
                            self.VC?.myBillingsTableView.isHidden = true
                            self.VC?.noDataFound.isHidden = false
                            self.VC?.billingHeaderStack.isHidden = true
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
