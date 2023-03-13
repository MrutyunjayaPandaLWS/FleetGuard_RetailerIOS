//
//  MyRedemptionListingVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 23/02/23.
//

import UIKit

class MyRedemptionListingVM {

    weak var VC: FG_MyRedemptionVC?
    var requestAPIs = RestAPI_Requests()
    var myRedemptionList = [ObjCatalogueRedemReqList1]()
//    var myRedemptionListArray = [ObjCatalogueRedemReqList1]()

    
    func myRedemptionLists(parameters: JSON) -> (){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }

        self.requestAPIs.redemptionListing_Post_API(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myRedemptionList = result?.objCatalogueRedemReqList ?? []
                        print(self.myRedemptionList.count)
                        if self.myRedemptionList.count != 0 {
                            self.VC?.myRedemptionTableView.isHidden = false
                            self.VC?.myRedemptionTableView.reloadData()
                            //self.VC?.filterOPBTN.isHidden = false
                            self.VC?.noDataFoundLbl.isHidden = true
                            
                        }else{
                            self.VC?.myRedemptionTableView.isHidden = true
                            //self.VC?.filterOPBTN.isHidden = true
                            self.VC?.noDataFoundLbl.isHidden = false
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

