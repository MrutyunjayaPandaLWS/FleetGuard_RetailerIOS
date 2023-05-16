//
//  MileStoneRedemptionVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 17/02/23.
//

import UIKit

class MileStoneRedemptionVM {
    
    weak var VC: FG_MyMilestoneRedemptionVC?
    var requestAPIs = RestAPI_Requests()
    var mileStonRedemptionArray = [LstRetailerBonding]()
    
    func mileStoneRedemptionAPI(parameters:JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.mileStoneRedemptionAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.mileStonRedemptionArray = result?.lstRetailerBonding ?? []
                        print(self.mileStonRedemptionArray.count, "MileStoneRedemption Count")
                        if self.mileStonRedemptionArray.count == 0 {
                            self.VC?.myMilestoneRedemptionTableView.isHidden = true
                            self.VC?.noDataFoundLBl.isHidden = false
                            if self.VC?.status == ""{
                                self.VC?.filterView.isHidden = true
                                self.VC?.filterOutBTN.isHidden = true
                            }
                        }else{
                            self.VC?.noDataFoundLBl.isHidden = true
                            self.VC?.filterOutBTN.isHidden = false
                            self.VC?.myMilestoneRedemptionTableView.isHidden = false
                            self.VC?.myMilestoneRedemptionTableView.reloadData()
                        }
                        self.VC?.stopLoading()
                    }
                }else{
                    DispatchQueue.main.async {
                        self.VC?.noDataFoundLBl.isHidden = false
                        self.VC?.stopLoading()
                        print("\(error)")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.VC?.noDataFoundLBl.isHidden = false
                    self.VC?.stopLoading()
                    print("\(error)")
                }
            }
        }
    }
    
}
