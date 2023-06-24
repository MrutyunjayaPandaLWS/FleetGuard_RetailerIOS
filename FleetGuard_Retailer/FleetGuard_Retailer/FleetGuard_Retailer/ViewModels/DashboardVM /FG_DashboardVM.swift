//
//  FG_DashboardVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 01/02/2023.
//

import UIKit
import LanguageManager_iOS


class FG_DashboardVM: popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    
    weak var VC: FG_DashBoardVC?
    weak var VC1: FG_SideMenuVC?
    var requestApis = RestAPI_Requests()
    var pushID = UserDefaults.standard.string(forKey: "TOKEN") ?? ""
    var categoryListArray = [LstAttributesDetails]()
    var pointBalence = [ObjCustomerDashboardList11]()
    var deviceID =  UserDefaults.standard.string(forKey: "deviceID") ?? ""
    
    func dashboardApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.dashboardApi(parameters: parameter) { (result, error) in
            if error == nil{
                self.VC?.stopLoading()
                if result != nil{
                    self.VC?.stopLoading()
                    print(self.deviceID,"skjns")
                    print(result?.deviceID,"kshjk")
                    if self.deviceID != result?.deviceID{
                        DispatchQueue.main.async {
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                            vc!.delegate = self
                            vc!.descriptionInfo = "Your_account_loged_in_by_other_mobile".localiz()
                            vc!.itsComeFrom = "DeviceLogedIn"
                            vc!.modalPresentationStyle = .overCurrentContext
                            vc!.modalTransitionStyle = .crossDissolve
                            self.VC?.present(vc!, animated: true, completion: nil)
                        }
                    }else{
                        DispatchQueue.main.async {
                            let dashboardDetails = result?.objCustomerDashboardList ?? []
                            if dashboardDetails.count != 0 {
                                UserDefaults.standard.setValue(result?.objCustomerDashboardList?[0].memberSince, forKey: "MemberSince")
                                print(result?.objCustomerDashboardList?[0].memberSince ?? "", "Membersince")
                                print(result?.objCustomerDashboardList?[0].notificationCount ?? "", "NotificationCount")
                                print(result?.objCustomerDashboardList?[0].redeemablePointsBalance ?? "", "totalpoints")
                                
                                
                                
                                
                                
                                
                                //                                UserDefaults.standard.setValue(result?.objCustomerDashboardList?[0].redeemablePointsBalance ?? "", forKey: "TotalPoints")
                                UserDefaults.standard.synchronize()
                                
                                
                            }
                            let customerFeedbakcJSON = result?.lstCustomerFeedBackJsonApi ?? []
                            if customerFeedbakcJSON.count != 0 {
                                if result?.lstCustomerFeedBackJsonApi?[0].customerStatus ?? 0 != 1{
                                    DispatchQueue.main.async{
//                                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
//                                        vc!.delegate = self
//                                        vc!.descriptionInfo = "Your account is deactivated please check with the administrator"
//                                        vc!.modalPresentationStyle = .overCurrentContext
//                                        vc!.modalTransitionStyle = .crossDissolve
//                                        self.VC?.present(vc!, animated: true, completion: nil)
                                        
                                        self.VC?.view.makeToast("account_is_deactivated".localiz(), duration: 4.0, position: .bottom)
                                    }
                                }else{
                                    self.VC?.welcomeTitle.text = result?.lstCustomerFeedBackJsonApi?[0].firstName ?? ""
                                    self.VC?.rplValueLbl.text = result?.lstCustomerFeedBackJsonApi?[0].passBookNumber ?? ""
                                    self.VC?.retailerCodeLbl.text = result?.lstCustomerFeedBackJsonApi?[0].loyaltyId ?? ""
                                    //  self.VC?.totalValue.text = result?.lstCustomerFeedBackJsonApi?[0].loyaltyId ?? ""
                                    self.VC?.companyNameLbl.text = result?.lstCustomerFeedBackJsonApi?[0].ownerName ?? ""
                                    UserDefaults.standard.setValue(result?.lstCustomerFeedBackJsonApi?[0].passBookNumber, forKey: "passBookNumber")
                                    UserDefaults.standard.setValue(result?.lstCustomerFeedBackJsonApi?[0].firstName, forKey: "FirstName")
                                    
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].loyaltyId, forKey: "LoyaltyId")
                                    self.VC?.loyaltyId = result?.lstCustomerFeedBackJsonApi?[0].loyaltyId ?? ""
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].merchantEmail ?? "", forKey: "MerchantEmail")
                                    print(result?.lstCustomerFeedBackJsonApi?[0].verifiedStatus ?? "")
                                    
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].verifiedStatus ?? "4", forKey: "verificationStatus")
                                    
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].customerMobile ?? "", forKey: "Mobile")
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].firstName ?? "", forKey: "FirstName")
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].lastName ?? "", forKey: "LastName")
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].customerEmail ?? "", forKey: "CustomerEmail")
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].merchantId ?? "", forKey: "MerchantID")
                                    UserDefaults.standard.set(result?.lstCustomerFeedBackJsonApi?[0].referralCode ?? "", forKey: "ReferralCode")
                                    UserDefaults.standard.synchronize()
                                }
                                
                            }
                            
                            
                            self.VC?.stopLoading()
                            
                            
                            
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
    
    func dashboardTotalPointsApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.dashboardTotalPointsApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                   let dashboardDetails = result?.objCustomerDashboardList ?? []
                    if dashboardDetails.count != 0 {
                        print("\(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0), Total Earned Points")
                    UserDefaults.standard.setValue(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0, forKey: "TotalPoints")
                        self.VC?.totalValue.text = "\(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0)"
                                UserDefaults.standard.synchronize()
                    }
                    self.VC?.stopLoading()
                    
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
    
    func productCategoryListingApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.productsCategoryListApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                    self.categoryListArray = result?.lstAttributesDetails ?? []
                    if self.categoryListArray.count != 0 {
                        self.VC?.nodataFoundLbl.isHidden = true
                        self.VC?.categoryCollectionView.isHidden = false
                        self.VC?.categoryCollectionView.reloadData()
                    }else{
                        self.VC?.nodataFoundLbl.isHidden = false
                        self.VC?.categoryCollectionView.isHidden = true
                    }
                }
                }else{
                    DispatchQueue.main.async {
                        self.VC?.nodataFoundLbl.isHidden = false
                    self.VC?.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.VC?.nodataFoundLbl.isHidden = false
                self.VC?.stopLoading()
                }
            }
        }
        
    }
    
    func pointBalenceAPI(parameter: JSON){
        DispatchQueue.main.async {
//            self.VC?.startLoading()
        }
        self.requestApis.pointBalenceAPI(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                DispatchQueue.main.async {
//                    self.VC?.stopLoading()
                    self.pointBalence = result?.objCustomerDashboardList ?? []
                    
                    if result?.objCustomerDashboardList?.count != 0 {
                        self.VC?.totalValue.text = "\(Int(result?.objCustomerDashboardList?[0].totalEarnedPoints ?? 0))"
                        UserDefaults.standard.set(result?.objCustomerDashboardList?[0].totalEarnedPoints, forKey: "totalEarnedPoints")
                        UserDefaults.standard.set(result?.objCustomerDashboardList?[0].redeemablePointsBalance, forKey: "redeemablePointsBalance")
                        
                        
                        UserDefaults.standard.set(true, forKey: "AfterLog")
                        UserDefaults.standard.synchronize()
                    }
                   
                }
                }else{
                    DispatchQueue.main.async {
//                    self.VC?.stopLoading()
                    }
                }
            }else{
                DispatchQueue.main.async {
//                self.VC?.stopLoading()
                }
            }
        }
        
    }
    

    func dashboardImagesAPICall(parameters: JSON, completion: @escaping (DashboardBannerImageModels?) -> ()) {
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.dashboardBanner_API(parameters: parameters) { (result, error) in
            if error == nil {
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        print(result)
                        //self.VC?.stopLoading()
                    }
                } else {
                    print("No Response")
                    DispatchQueue.main.async {
                        completion(result)
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_Login \(error)")
                DispatchQueue.main.async {
                    self.VC?.bannerImage.isHidden = true
                    self.VC?.emptyImageView.isHidden = false
                    self.VC?.stopLoading()
                }
                
            }
            
        }
    }
    
    
    func deleteAccount(parameters: JSON, completion: @escaping (DeleteAccountModels?) -> ()) {
        self.VC1?.startLoading()
        self.requestApis.deleteAccountApi(parameters: parameters) { (result, error) in
            if error == nil {
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        self.VC?.stopLoading()
                    }
                } else {
                    print("No Response")
                    DispatchQueue.main.async {
                        self.VC1?.stopLoading()
                    }
                }
            }else{
                print("ERROR_Login \(error)")
                DispatchQueue.main.async {
                    self.VC1?.stopLoading()
                }
                
            }
            
        }
    }
    
    
    //MARK: - PROFILE Image Submission
    func imageSubmissionAPI(loyaltyID: String ,base64: String) {
        DispatchQueue.main.async {
            self.VC?.startLoading()
         }
        let parameters = [
            "ActorId": "\(UserDefaults.standard.string(forKey: "UserID") ?? "")",
            "ObjCustomerJson": [
                "DisplayImage": "\(VC1?.strdata1 ?? "")",
                "LoyaltyId": "\(loyaltyID)"
            ]
        ]as [String : Any]
        print(parameters,"imageAPI")
        self.requestApis.imageSavingAPI(parameters: parameters) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        print(result?.returnMessage ?? "", "ReturnMessage")
                        if result?.returnMessage ?? "" == "1"{
                            DispatchQueue.main.async{
                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FG_PopUpVC") as? FG_PopUpVC
                                vc!.titleInfo = ""
                                vc!.itsComeFrom = "sidemenu"
                                vc!.descriptionInfo = "profile_update_message".localiz()
                                vc!.modalPresentationStyle = .overFullScreen
                                vc!.modalTransitionStyle = .crossDissolve
                                self.VC1?.closeLeft()
                                self.VC1?.present(vc!, animated: true, completion: nil)
                            }
                        }else{
                            DispatchQueue.main.async{
                                self.VC1?.closeLeft()
                                self.VC1?.view.makeToast("profile_update_failed".localiz(), duration: 3.0, position: .bottom)
                            }
                        }
                        
                        self.VC1?.stopLoading()
                    }
                }else{
                    DispatchQueue.main.async {
                        self.VC1?.stopLoading()
                    }
                }
                
            }else{
                DispatchQueue.main.async {
                    self.VC1?.stopLoading()
                }
            }
        }
    }
    
    
}
