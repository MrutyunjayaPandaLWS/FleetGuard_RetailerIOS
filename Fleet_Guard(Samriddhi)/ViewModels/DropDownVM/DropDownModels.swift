//
//  DropDownModels.swift
//  CenturyPly_JSON
//
//  Created by ADMIN on 19/04/2022.
//

import UIKit

class DropDownModels{
    
    weak var VC: FG_DropDownVC?
    var requestAPIs = RestAPI_Requests()
    var stateArray = [StateList]()
    var cityArray = [CityList]()
    var languageList = [LstAttributesDetails1]()
    var helpTopicListArray = [ObjHelpTopicList]()
    func statelisting(parameters:JSON){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.getStateListApi(parameters: parameters) { (result, error) in
            if error == nil {
                if result != nil{
                    DispatchQueue.main.async {
                        self.stateArray = (result?.stateList ?? [])
                        print(self.stateArray.count)
                        if self.stateArray.count == 0{
                            self.VC?.dropDownTableView.isHidden = true
                            self.VC?.noDataFoundLbl.isHidden = false
                        }else{
                            self.VC?.dropDownTableView.isHidden = false
                            self.VC?.dropDownTableView.reloadData()
                            self.VC?.noDataFoundLbl.isHidden = true
                        }
                        self.VC?.stopLoading()
                    }
                }else{
                    print("NO RESPONSE")
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_ \(error)")
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                }
                
            }
            
        }
    }
    
    func citylisting(parameters:JSON){
        DispatchQueue.main.async {
              self.VC?.startLoading()
         }
        self.requestAPIs.getCityListApi(parameters: parameters) { (result, error) in
            if error == nil {
                if result != nil{
                    DispatchQueue.main.async {
                        self.cityArray = (result?.cityList ?? [])
                        if self.cityArray.count == 0{
                            self.VC?.dropDownTableView.isHidden = true
                            self.VC?.noDataFoundLbl.isHidden = false
                        }else{
                            self.VC?.dropDownTableView.isHidden = false
                            self.VC?.dropDownTableView.reloadData()
                            self.VC?.noDataFoundLbl.isHidden = true
                        }
                        self.VC?.stopLoading()
                    }
                }else{
                    print("NO RESPONSE")
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_ \(error)")
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                }
                
            }
            
        }
    }
    
    func helpTopiceListAPi(parameter: JSON){
        self.VC?.startLoading()
//        self.VC?.loaderView.isHidden = false
//         self.VC?.playAnimation2()
        self.requestAPIs.getHelpTopicList(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.helpTopicListArray = result?.objHelpTopicList ?? []
                        if self.helpTopicListArray.count != 0 {
                            self.VC?.dropDownTableView.isHidden = false
                            //self.VC?.loaderView.isHidden = true
                            self.VC?.dropDownTableView.reloadData()
                        }else{
                            //self.VC?.view.makeToast("No data found !!", duration: 3.0, position: .center)
                            self.VC?.dropDownTableView.isHidden = true
                            //self.VC?.loaderView.isHidden = true
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        //self.VC?.loaderView.isHidden = true
                        self.VC?.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
                    //self.VC?.loaderView.isHidden = true
                    self.VC?.stopLoading()
                }
            }
        }
    }
    
   
    
//    func myRedemptionListApi(parameters:JSON){
//        DispatchQueue.main.async {
//              self.VC?.startLoading()
//         }
//        self.requestAPIs.myRedemptionStausListApi(parameters: parameters) { (result, error) in
//            if error == nil {
//                if result != nil{
//                    DispatchQueue.main.async {
//                        self.myRedemptionListArray = (result?.lstAttributesDetails ?? [])
//                        if self.myRedemptionListArray.count == 0{
//                            self.VC?.dropDownTableView.isHidden = true
//                            self.VC?.noDataFoundLbl.isHidden = false
//                        }else{
//                            self.VC?.dropDownTableView.isHidden = false
//                            self.VC?.dropDownTableView.reloadData()
//                            self.VC?.noDataFoundLbl.isHidden = true
//                        }
//                        self.VC?.loaderView.isHidden = true
//                        self.VC?.stopLoading()
//                    }
//                }else{
//                    print("NO RESPONSE")
//                    DispatchQueue.main.async {
//                        self.VC?.loaderView.isHidden = true
//                        self.VC?.stopLoading()
//                    }
//                }
//            }else{
//                print("ERROR_ \(error)")
//                DispatchQueue.main.async {
//                    self.VC?.loaderView.isHidden = true
//                    self.VC?.stopLoading()
//                }
//
//            }
//
//        }
//    }
    
    func languageListApi(parameter: JSON){
        self.languageList.removeAll()
        VC?.startLoading()
        requestAPIs.language_Api(parameters: parameter) { result, error in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.languageList = result?.lstAttributesDetails ?? []
                        if self.languageList.count != 0{
//                            self.VC?.heightOfTableView.constant = CGFloat(45 * self.languageList.count)
//                            self.VC?.rowNumber = self.languageList.count
                            self.VC?.dropDownTableView.reloadData()
                            self.VC?.stopLoading()
                            
                        }else{
                            self.VC?.dropDownTableView.isHidden = true
                            self.VC?.noDataFoundLbl.isHidden = false
                            self.VC?.stopLoading()
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        self.VC?.dropDownTableView.isHidden = true
                        self.VC?.noDataFoundLbl.isHidden = false
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("Language Api error",error?.localizedDescription)
                DispatchQueue.main.async {
                    self.VC?.dropDownTableView.isHidden = true
                    self.VC?.noDataFoundLbl.isHidden = false
                    self.VC?.stopLoading()
                }
            }
        }
        
    }
    
    
}
