//
//  FG_ProductDetailsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 02/02/2023.
//

import UIKit

class FG_ProductDetailsVM: popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    weak var VC: FG_ProductCatalogueDetailsVC?
    var requestApis = RestAPI_Requests()
    var productListArray = [LsrProductDetails]()
    func addToCartApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.addToCartAPi(parameters: parameter) { (result, error) in
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
                            self.VC?.myCartApi()
                        }else{
                            DispatchQueue.main.async{
//                               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                               vc!.delegate = self
//                                vc!.descriptionInfo = "Something went wrong! Try againg Later..."
//                               vc!.modalPresentationStyle = .overCurrentContext
//                               vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
                                
                                self.VC?.view.makeToast("Something went wrong! Try againg Later...", duration: 4.0, position: .bottom)
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
    
    func mycartListAPi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.myCartListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        let myCartListArray = result?.lstCustomerCart ?? []
                        print(myCartListArray.count, "MyCart Count")
                        if myCartListArray.count != 0 {
                            self.VC?.cartCountLbl.isHidden = false
                            self.VC?.cartCountLbl.text = "\(myCartListArray.count)"
                            
                            for data in myCartListArray{
                                print(data.productId!)
                                print(self.VC?.productId ?? "")
                                if data.productId ?? 0 == Int(self.VC?.productId ?? "")!{
                                    self.VC?.qtyTF.text = "\(data.quantity ?? 0)"
                                    self.VC?.quantity = "\(data.quantity ?? 0)"
                                    self.VC?.customerCartId = "\(data.customerCartId ?? 0)"
                                    self.VC?.value = data.quantity ?? 0
                                    self.VC?.productQuantityView.isHidden = false
                                    self.VC?.addToCartView.isHidden = true
                                    self.VC?.rowTotalPrice = Int(data.rowTotalPrice ?? 0)
                                    self.VC?.totalRedeemabelPts = Int(data.landingTotalPrice ?? 0)
                                    self.VC?.productQty = Int(data.quantity ?? 0)
                                    self.VC?.orderNowStackView.isHidden = false
                                }
                            }
                        }else{
                            self.VC?.value = 1
                            self.VC?.cartCountLbl.isHidden = true
                            self.VC?.productQuantityView.isHidden = true
                            self.VC?.addToCartView.isHidden = false
                            self.VC?.orderNowStackView.isHidden = true
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
    
    
    
    func productListApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.productListingApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.productListArray = result?.lsrProductDetails ?? []
                        if self.productListArray.count != 0{
                         
                            for data in self.productListArray{
                                
                                if data.productId ?? 0 == Int(self.VC?.productId ?? "")!{
//                                    self.VC?.productImageURL = ""
//                                    self.VC?.productName = data.productName ?? ""
//                                    self.VC?.partNo = data.productCode ?? ""
//                                    self.VC?.shortDesc = data.productShortDesc ?? ""
                                    //self.VC?.dap = data.quantity ?? ""
                                   // self.VC?.mrp = "\(data.salePrice ?? 0)"
                                    
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
//                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                                vc!.delegate = self
//                                vc!.descriptionInfo = "Something went wrong. Try againg later!"
//                                vc!.modalPresentationStyle = .overCurrentContext
//                                vc!.modalTransitionStyle = .crossDissolve
//                                self.VC?.present(vc!, animated: true, completion: nil)
                                
                                self.VC?.view.makeToast("Something went wrong! Try againg Later...", duration: 4.0, position: .bottom)
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
}

