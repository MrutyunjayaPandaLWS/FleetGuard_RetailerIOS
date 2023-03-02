//
//  RedemptionCatalogueMyCartVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 04/02/2023.
//

import UIKit

class RedemptionCatalogueMyCartVM: popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    weak var VC: FG_MyCartVC?
    var requestApis = RestAPI_Requests()
    var redemptionCatalogueMyCartListArray = [CatalogueSaveCartDetailListResponse]()
 
    
    
    func redemptionCatalogueMyCartListApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.redemptionCatalogueMycartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.redemptionCatalogueMyCartListArray = result?.catalogueSaveCartDetailListResponse ?? []
                        if self.redemptionCatalogueMyCartListArray.count != 0 {
                            self.VC?.myCartTableView.reloadData()
                            self.VC?.myCartTableView.isHidden = false
                            self.VC?.nodataFoundLbl.isHidden = true
                            let changeToInt  = Int(self.redemptionCatalogueMyCartListArray[0].sumOfTotalPointsRequired ?? 0.0)
                            print(changeToInt)
                            self.VC?.totalRedeemablePtsLbl.text = "\(changeToInt)"
                            self.VC?.totalRedeemabelPts = Int(self.redemptionCatalogueMyCartListArray[0].sumOfTotalPointsRequired ?? 0.0)
                            self.VC?.popUpView.isHidden = false
                        }else{
                            self.VC?.myCartTableView.isHidden = true
                            self.VC?.nodataFoundLbl.isHidden = false
                            self.VC?.popUpView.isHidden = true
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
                                vc!.descriptionInfo = "Product added into cart successfully."
                               vc!.modalPresentationStyle = .overCurrentContext
                               vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                            }
                            self.VC?.myCartListApi()
                        }else{
                            DispatchQueue.main.async{
                               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                               vc!.delegate = self
                                vc!.descriptionInfo = "Something went wrong! Try againg Later..."
                               vc!.modalPresentationStyle = .overCurrentContext
                               vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
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
    
    func productQtyUpdate(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.redemptionCatalogueCartUpdateApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        if result?.returnMessage ?? "" != "1"{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.descriptionInfo = "Something went wrong. Try againg later!"
                                vc!.modalPresentationStyle = .overCurrentContext
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                                self.VC?.stopLoading()
                            }
                        }else{
                            self.VC?.myCartListApi()
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
//
    
    func productRemoveInCartApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.redemptionCatalogueCartRemoveApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        if result?.returnMessage ?? "" != "1"{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.descriptionInfo = "Something went wrong. Try againg later!"
                                vc!.modalPresentationStyle = .overCurrentContext
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                                self.VC?.stopLoading()
                            }
                        }else{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.descriptionInfo = "Product has been removed successfully!"
                                vc!.modalPresentationStyle = .overCurrentContext
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                                self.VC?.stopLoading()
                            }
                            self.VC?.myCartListApi()
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




