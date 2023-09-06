//
//  FG_RedemptionCatalogueVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 03/02/2023.
//

import UIKit
import LanguageManager_iOS

class FG_RedemptionCatalogueVM: popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    weak var VC: FG_RedemptionCatalogueVC?
    weak var VC1: FG_CatalogueFilterView?
    
    var requestApis = RestAPI_Requests()
   var redemptionCatalougeListArray = [ObjCatalogueList]()
    var redemptionCatalougeListArray1 = [ObjCatalogueList]()
    var redemptionCatalogueMyCartListArray = [CatalogueSaveCartDetailListResponse]()
    var productArray = [ObjCatalogueList]()
    
    
func redemptionCatalogueMyCartListApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
            self.VC?.myCartIds.removeAll()
        }
        self.requestApis.redemptionCatalogueMycartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.redemptionCatalogueMyCartListArray = result?.catalogueSaveCartDetailListResponse ?? []
                        if self.redemptionCatalogueMyCartListArray.count != 0 {
                            self.VC?.countLbl.isHidden = false
                            self.VC?.cartTotalPts = Int(self.redemptionCatalogueMyCartListArray[0].sumOfTotalPointsRequired ?? 0.0)
                            self.VC?.countLbl.text = "\(self.redemptionCatalogueMyCartListArray.count)"
                            for data in self.redemptionCatalogueMyCartListArray{
                                
                                self.VC?.myCartIds.append(data.catalogueId ?? 0)
                                
                            }
                        }else{
                            self.VC?.countLbl.isHidden = true
                            
                        }
                        self.VC?.redemptionCatalogueListApi(startIndex: self.VC?.startindex ?? 0)
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
    func redemptionCatalogueListApi(parameter: JSON){
        self.redemptionCatalougeListArray1.removeAll()
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.redemptionCatalogueListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.redemptionCatalougeListArray1 = result?.objCatalogueList ?? []
                        self.VC?.noofelements = self.redemptionCatalougeListArray1.count
                        
                        self.redemptionCatalougeListArray = self.redemptionCatalougeListArray + self.redemptionCatalougeListArray1
                        
                        if self.redemptionCatalougeListArray.count != 0 {
                            self.VC?.catalogueListTableView.isHidden = false
                            self.VC?.noDataFoundLbl.isHidden = true
                            self.VC?.catalogueListTableView.reloadData()
                        }else{
                            self.VC?.catalogueListTableView.isHidden = true
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
    
    
    func redemptionCatalogueAddToCartApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.redemptionCatalogueAddToCartApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        print(result?.returnValue ?? 0)
                        if result?.returnValue ?? 0 == 1{
                            DispatchQueue.main.async{
                               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                               vc!.delegate = self
                                vc!.descriptionInfo = "added_to_cart_success_message".localiz()
                               vc!.modalPresentationStyle = .overCurrentContext
                               vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                            }
                            self.VC?.myCartListApi()
                        }else{
                            DispatchQueue.main.async{
//                               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                               vc!.delegate = self
//                                vc!.descriptionInfo = "Something went wrong! Try againg Later..."
//                               vc!.modalPresentationStyle = .overCurrentContext
//                               vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
                                
                                self.VC?.view.makeToast("Something_went_wrong_error".localiz(), duration: 4.0, position: .bottom)
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
    
    //redemptionCatalogueAddToCartApi
    
   
}



