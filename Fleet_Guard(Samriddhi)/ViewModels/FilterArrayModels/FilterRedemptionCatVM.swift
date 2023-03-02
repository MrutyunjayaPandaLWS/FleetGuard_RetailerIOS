//
//  FilterRedemptionCatVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 25/02/23.
//

import UIKit

class FilterRedemptionCatVM {
    
    weak var VC: FG_CatalogueFilterView?
    
    var requestAPIs = RestAPI_Requests()
    var redemptionCategoryArray = [ObjCatalogueCategoryListJson]()
    
    func redemptionCateogry(parameters: JSON) -> (){
        self.requestAPIs.redemptionCateogryListing(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil {
                    self.redemptionCategoryArray = result?.objCatalogueCategoryListJson ?? []
                    print(self.redemptionCategoryArray.count,"dlskjdkj")
                    if self.redemptionCategoryArray.count != 0 {
                        DispatchQueue.main.async {
                            self.VC?.stopLoading()
                            self.VC?.categoryListCollectionView.isHidden = false
                            self.VC?.categoryListCollectionView.reloadData()
                        }
                    }else{
                        self.VC?.categoryListCollectionView.isHidden = true
                        
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
class ProductCateogryModels : NSObject{
    var productCategoryId:String!
    var productCategorName:String!
    var isSelected: Int!
    init(productCategoryId: String, productCategorName: String, isSelected: Int!){
        self.productCategoryId = productCategoryId
        self.productCategorName = productCategorName
        self.isSelected = isSelected
    }
}
