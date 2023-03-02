//
//  MyBillingDetailsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 23/02/23.
//

import UIKit

class MyBillingDetailsVM: UIViewController {
    
    weak var VC: FG_MyBillingDetailsVC?
    var requestAPIs = RestAPI_Requests()
    var myOrderListingDetailsArray = [LstOrderDetails]()
    var customerCartArray = [LstCustomerCartApi]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
    
    func myOrderDetailsListingAPI(parameters:JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.myBillingDetailsListingAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myOrderListingDetailsArray = result?.lstOrderDetails ?? []
                        print(self.myOrderListingDetailsArray.count, "myOrderDetailsArrayCount")
                        if self.myOrderListingDetailsArray.count != 0 {
                            self.VC?.orderDetailsTV.isHidden = false
                            self.VC?.orderDetailsTV.reloadData()
                            self.VC?.noDataFoundLbl.isHidden = true
                            
                        }else{
                            self.VC?.orderDetailsTV.isHidden = true
                            self.VC?.orderView.isHidden = true
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
