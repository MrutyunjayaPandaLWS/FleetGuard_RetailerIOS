//
//  MyRedemptionListingVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 23/02/23.
//

import UIKit

class MileStoneRedemptionListVM: popUpDelegate {
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    

    weak var VC: FG_MilestoneRedemptionVC?
    var requestAPIs = RestAPI_Requests()
    var myRedemptionList = [LstRetailerBonding11]()
    var redeemData = ""
//    var myRedemptionListArray = [ObjCatalogueRedemReqList1]()

    
    func mileStonesRedemptionListAPI(parameters: JSON) -> (){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }

        self.requestAPIs.milestonesRedemptionListAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myRedemptionList = result?.lstRetailerBonding ?? []
                        print(self.myRedemptionList.count)
                        if self.myRedemptionList.count != 0 {
                            self.VC?.myRedemptionTableView.isHidden = false
                            self.VC?.myRedemptionTableView.reloadData()
                            
                        }else{
                            self.VC?.myRedemptionTableView.isHidden = true
                            
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
    
    
    
    func redeemBTNAPI(parameters: JSON) -> (){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.redeemDataAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        print(result?.returnMessage ?? "")
                    if result?.returnMessage ?? "" == "1"{
                        //FG_PopUpVC
                        DispatchQueue.main.async{
                           let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                            vc!.delegate = self
                            vc!.descriptionInfo = "Redeemed successfully!"
                            vc!.modalPresentationStyle = .overFullScreen
                            vc!.modalTransitionStyle = .crossDissolve
                            self.VC?.present(vc!, animated: true, completion: nil)
                        }
                    }else{
                        self.VC!.view.makeToast("Something went wrong please try again later.", duration: 3.0, position: .bottom)
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                            self.VC?.navigationController?.popViewController(animated: true)
                        })
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

