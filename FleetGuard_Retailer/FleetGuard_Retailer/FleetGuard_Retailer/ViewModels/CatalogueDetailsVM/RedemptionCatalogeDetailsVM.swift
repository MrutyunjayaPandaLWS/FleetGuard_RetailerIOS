//
//  RedemptionCatalogeDetailsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 25/02/23.
//

import UIKit
import LanguageManager_iOS

class RedemptionCatalogeDetailsVM: popUpDelegate {
    
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}

    weak var VC: FG_RedemptionCatalogueDetailsVC?
    //weak var VC1: FG_CatalogueFilterView?
    
    
    
    var requestApis = RestAPI_Requests()
    var redemptionCatalougeListArray = [ObjCatalogueList]()
    var redemptionCatalogueMyCartListArray = [CatalogueSaveCartDetailListResponse]()
   // var redemptionCatalogueMyCartListArray = [CatalogueSaveCartDetailListResponse]()

    func redemptionCatalogueListApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.redemptionCatalogueListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.redemptionCatalougeListArray = result?.objCatalogueList ?? []
                        if self.redemptionCatalougeListArray.count != 0 {
                            //                            self.VC?.catalogueListTableView.reloadData()
                            //                            self.VC?.catalogueListTableView.isHidden = false
                            //self.VC?.noDataFoundLbl.isHidden = true
                            
                        }else{
                            //                            self.VC?.catalogueListTableView.isHidden = true
                            //                            self.VC?.noDataFoundLbl.isHidden = false
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
                                self.VC?.addToCartView.isHidden = true
                                self.VC?.addedToCartView.isHidden = false
                                self.VC?.addToCartActionBTN.isEnabled = true
                                self.VC?.myCartListApi()
                            }
                          
                        }else{
                            DispatchQueue.main.async{
//                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                                vc!.delegate = self
//                                vc!.descriptionInfo = "Something went wrong! Try againg Later..."
//                                vc!.modalPresentationStyle = .overCurrentContext
//                                vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
                                self.VC?.view.makeToast("Something_went_wrong_error".localiz(), duration: 3.0, position: .bottom)
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
    
//    func redemptionCatalogueMyCartListApi(parameters: JSON, completion: @escaping(CatalogueSaveCartDetailListResponse?) -> ()){
//        DispatchQueue.main.async {
//                    self.VC?.startLoading()
//                }
//        self.requestApis.redemptionCatalogueMycartListApi(parameters: parameters) { (result, error) in
//            if error == nil{
//                if result != nil {
//                    DispatchQueue.main.async {
//                        completion(result)
//
//                        self.VC?.stopLoading()
//                    }
//                } else {
//                    print("No Response")
//                    DispatchQueue.main.async {
//
//                        self.VC?.stopLoading()
//                    }
//                }
//            }else{
//                print("ERROR_Login \(error)")
//                DispatchQueue.main.async {
//
//                    self.VC?.stopLoading()
//                }
//
//        }
//    }
//
//    }
    
//    func redemptionCatalogueMyCartListApi(parameter: JSON){
//            DispatchQueue.main.async {
//                self.VC?.startLoading()
//                //self.VC?.myCartIds.removeAll()
//            }
//            self.requestApis.redemptionCatalogueMycartListApi(parameters: parameter) { (result, error) in
//                if error == nil{
//                    if result != nil{
//                        DispatchQueue.main.async {
//                            self.VC?.stopLoading()
//                            self.redemptionCatalogueMyCartListArray = result?.catalogueSaveCartDetailListResponse ?? []
//
//                            if self.redemptionCatalogueMyCartListArray.count != 0 {
//                                self.VC?.countLbl.isHidden = false
//                                self.VC?.countLbl.text = "\(self.redemptionCatalogueMyCartListArray.count)"
//                            }else{
//                                self.VC?.countLbl.isHidden = true
//
//                            }
//                            let filterArray = self.redemptionCatalogueMyCartListArray.filter{$0.catalogueId == self.VC?.catalogueId}
//
//                            print(filterArray.count,"skhask")
//
//                            if filterArray.count > 0 {
//                                self.VC?.addedToCartView.isHidden = false
//                                self.VC?.addToCartView.isHidden = true
//                            }else{
//
//                                self.VC?.addedToCartView.isHidden = true
//                                self.VC?.addToCartView.isHidden = false
//                            }
//
//
//
//                        }
//
//                    }else{
//                        DispatchQueue.main.async {
//                            self.VC?.stopLoading()
//                            print("\(error)")
//                        }
//                    }
//                }else{
//                    DispatchQueue.main.async {
//                        self.VC?.stopLoading()
//                        print("\(error)")
//                    }
//                }
//            }
//        }
    
    
    
}

