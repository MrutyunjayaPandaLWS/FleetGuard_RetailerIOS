//
//  MyOrderDetailsListingVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 21/02/23.
//

import UIKit

class MyOrderDetailsListingVM {
    weak var VC: FG_MyOrdersDetailsVC?
    var requestAPIs = RestAPI_Requests()
    var myOrderListingDetailsArray = [LstOrderDetails]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var myOrderListArray = [LstCustomerCartApi]()
   
    func myOrderDetailsListingAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
            self.requestAPIs.myOrderDetailsListingAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myOrderListingDetailsArray = result?.lstOrderDetails ?? []
                        print(self.myOrderListingDetailsArray.count, "myOrderDetailsArrayCount")
                        
                        for items in self.myOrderListingDetailsArray{
                            self.myOrderListArray = items.lstCustomerCartApi ?? []
                            print(self.myOrderListArray.count,"sddg")
                            for data in self.myOrderListArray {
                                if self.myOrderListArray.count != 0{
                                        self.VC?.orderDetailsTV.isHidden = false
                                        self.VC?.orderDetailsTV.reloadData()
                                        self.VC?.noDataFoundLbl.isHidden = true
                                        
                                    }else{
                                        self.VC?.orderDetailsTV.isHidden = true
                                        self.VC?.orderView.isHidden = true
                                        self.VC?.noDataFoundLbl.isHidden = false
                                    }
                            }
                                
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
