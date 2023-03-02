//
//  DD_QueryListVM.swift
//  DD_Motors
//
//  Created by ADMIN on 28/12/2022.
//


import UIKit
import Toast_Swift

class FG_QueryListVM {
    
    weak var VC: FG_LodgeQueryVC?
    var pushID = UserDefaults.standard.string(forKey: "DEVICE_TOKEN") ?? ""
    var requestAPIs = RestAPI_Requests()
    var parameters = [String: Any]()
    let userID = UserDefaults.standard.string(forKey: "UserID") ?? ""
    var queryListArray = [ObjCustomerAllQueryJsonList]()
    var queryTopicListArray = [LstAttributesDetails]()
    
    func querListsApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        
        }
        self.requestAPIs.queryListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.queryListArray = result?.objCustomerAllQueryJsonList ?? []
                        self.VC?.noofelements = self.queryListArray.count
                        print(self.queryListArray.count,"skjhdks")
                        if self.queryListArray.count != 0 {
                            self.VC?.lodgeQueryListTableView.isHidden = false
                            self.VC?.lodgeQueryListTableView.reloadData()
                        }else{
                            self.VC?.view.makeToast("No data found !", duration: 2.0, position: .bottom)
                            self.VC?.lodgeQueryListTableView.isHidden = true
                            //self.VC?.filterView.isHidden = true
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                      
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                }
            }
        }
    }
    
//    func queryTopicListApi(parameter: JSON){
//        self.VC?.startLoading()
//        self.VC?.loaderView.isHidden = false
//         self.VC?.playAnimation2()
//        self.requestAPIs.queryTopicListApi(parameters: parameter) { (result, error) in
//            if error == nil{
//                if result != nil{
//                    DispatchQueue.main.async {
//                        self.VC?.loaderView.isHidden = true
//                        self.VC?.stopLoading()
//                        self.queryTopicListArray = result?.lstAttributesDetails ?? []
//                        if self.queryTopicListArray.count != 0 {
//                            self.VC?.dropDownTableView.isHidden = false
//                            if self.queryTopicListArray.count < 20{
//                                self.VC?.tableHeight = Int(CGFloat(self.queryTopicListArray.count * 30))
//                                self.VC?.bottomSpaceConstraint.constant = CGFloat(self.VC!.tableHeight)
//                                self.VC?.dropDownTableHeight.constant = CGFloat(self.VC!.tableHeight)
//                            }else if self.queryTopicListArray.count > 20{
//                                self.VC?.tableHeight = Int(CGFloat(300))
//                                self.VC?.bottomSpaceConstraint.constant = CGFloat(self.VC!.tableHeight)
//                                self.VC?.dropDownTableHeight.constant = CGFloat(self.VC!.tableHeight)
//                            }
//                            self.VC?.dropDownTableView.reloadData()
//
//                        }else{
//                            self.VC?.view.makeToast("No data found !!", duration: 2.0, position: .bottom)
//                            self.VC?.dropDownTableView.isHidden = true
//                        }
//                    }
//                }else{
//                    DispatchQueue.main.async {
//                        self.VC?.loaderView.isHidden = true
//                        self.VC?.stopLoading()
//                    }
//                }
//            }else{
//                DispatchQueue.main.async {
//                    self.VC?.loaderView.isHidden = true
//                    self.VC?.stopLoading()
//                }
//            }
//        }
//    }
}
