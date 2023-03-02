//
//  FG_ProductMyCartVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 02/02/2023.
//

import UIKit

class FG_ProductMyCartVM: popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    weak var VC: FG_ProductCatalogueMyCartVC?
    var requestApis = RestAPI_Requests()
   var myCartListArray = [LstCustomerCart]()
    
    func mycartListAPi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.myCartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myCartListArray = result?.lstCustomerCart ?? []
                        if self.myCartListArray.count != 0 {
                            self.VC?.noDataFoundLbl.isHidden = true
                            self.VC?.prodCatalogueCartTableView.isHidden = false
                            self.VC?.processToCheckoutView.isHidden = false
                            self.VC?.totalRedeemabelPtsLbL.text = "\(self.myCartListArray[0].landingTotalPrice ?? 0.0)"
                            self.VC?.totalRedeemabelPts = Int(self.myCartListArray[0].landingTotalPrice ?? 0.0)
                            self.VC?.cartDetailsArray.removeAll()
                            for data in self.myCartListArray{
                                let productListArray: [String: Any] = [
                                    "ProdPrice": "\(data.prodPrice ?? 0.0)",
                                    "ProductId": "\(data.productId ?? 0)",
                                    "CustomerCartIds": "\(data.customerCartId ?? 0)",
                                    "RowTotalPrice": "\(data.rowTotalPrice ?? 0.0)",
                                    "Quantity": "\(data.quantity ?? 0)"
                                ]
                                self.VC?.cartDetailsArray.append(productListArray)
                            }
                            self.VC?.prodCatalogueCartTableView.reloadData()
                        }else{
                            self.VC?.noDataFoundLbl.isHidden = false
                            self.VC?.processToCheckoutView.isHidden = true
                            self.VC?.prodCatalogueCartTableView.isHidden = true
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
        self.requestApis.productQuantityUpdateApi(parameters: parameter) { (result, error) in
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
                            self.VC?.myCartApi()
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
        self.requestApis.productRemoveInCartApi(parameters: parameter) { (result, error) in
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
                            self.VC?.myCartApi()
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
    
    
    func placeOrderSubmissionApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.productPlaceOrderApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        let response = String(result?.returnMessage ?? "").split(separator: "~")
                        if response.count != 0 {
                            if response[0] == "1"{
                                DispatchQueue.main.async{
                                    
                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_ProductCataloguePopUp") as? FG_ProductCataloguePopUp
                                  
                                    vc!.modalPresentationStyle = .overCurrentContext
                                    vc!.modalTransitionStyle = .crossDissolve
                                    self.VC?.present(vc!, animated: true, completion: nil)
                                    self.VC?.stopLoading()
                                }
                            }else{
                                DispatchQueue.main.async{
                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                    vc!.delegate = self
                                    vc!.descriptionInfo = "Something went wrong. Try againg later!"
                                    vc!.modalPresentationStyle = .overCurrentContext
                                    vc!.modalTransitionStyle = .crossDissolve
                                    self.VC?.present(vc!, animated: true, completion: nil)
                                    self.VC?.stopLoading()
                                }
                            }
                        }else{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.delegate = self
                                vc!.descriptionInfo = "Something went wrong. Try againg later!"
                                vc!.modalPresentationStyle = .overCurrentContext
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC?.present(vc!, animated: true, completion: nil)
                                self.VC?.stopLoading()
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


