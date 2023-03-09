//
//  MyOrderListingVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 17/02/23.
//

import UIKit

class MyOrderListingVM {
    weak var VC: FG_MyOrdersVC?
    var requestAPIs = RestAPI_Requests()
    var myOrderListingArray = [LstCustOrderDeliveryDetails]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
   
    func myOrderListingAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
            self.requestAPIs.myOrderListingAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myOrderListingArray = result?.lstCustOrderDeliveryDetails ?? []
                        self.VC?.noofelements = self.myOrderListingArray.count
                        
                        print(self.myOrderListingArray.count, "myOrderListingArray Count")
                        if self.myOrderListingArray.count != 0 {
                            self.VC?.myOrderTableView.isHidden = false
                            self.VC?.myOrderTableView.reloadData()
                            self.VC?.noDataFound.isHidden = true
                            self.VC?.orderHeaderStack.isHidden = false
                            
                        }else{
                            self.VC?.myOrderTableView.isHidden = true
                            self.VC?.noDataFound.isHidden = false
                            self.VC?.orderHeaderStack.isHidden = true
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
