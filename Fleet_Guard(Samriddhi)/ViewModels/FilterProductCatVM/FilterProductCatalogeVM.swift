//
//  FilterProductCatalogeVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 21/02/23.
//

import UIKit

class FilterProductCatalogeVM {
    weak var VC: FG_ProductCatalogueFilterVC?
    var requestAPIs = RestAPI_Requests()
    var myfilterListingArray = [LsrProductDetails1]()
    var myFilterLisingArrayOfData = [LsrProductDetails1]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    
   
    func filterProdListingAPI(parameters:JSON){
            DispatchQueue.main.async {
                self.VC?.startLoading()
            }
            self.requestAPIs.filterProductCatAPI(parameters: parameters) { (result, error) in
                if error == nil{
                    if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.myfilterListingArray = result?.lsrProductDetails ?? []
                        print(self.myfilterListingArray.count, "filterProdListingCount")
                        if self.myfilterListingArray.count != 0 {
                            self.VC?.categoryListCollectionView.isHidden = false
                            self.VC?.categoryListCollectionView.reloadData()
                            //self.VC?.noDataFoundLbl.isHidden = true
                            
                        }else{
                            self.VC?.categoryListCollectionView.isHidden = true
                           // self.VC?.orderView.isHidden = true
                            //self.VC?.noDataFoundLbl.isHidden = false
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

